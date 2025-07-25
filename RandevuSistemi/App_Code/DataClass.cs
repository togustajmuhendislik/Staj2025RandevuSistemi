﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using RandevuSistemi.App_Code;

namespace RandevuSistemi.App_Code
{
    public class DataClass:MainClass
    {
        public FullCalendarJsonDataClass OrnekTakvimGetirAylik(string AyYil, string IP, string UserId)
        {
            // AyYil formatı: "yyyy-MM" örn: "2025-07"
            string Metod = "";
            FullCalendarJsonDataClass sonuc = null;

            try
            {
                var yilAy = AyYil.Split('-');
                int yil = int.Parse(yilAy[0]);
                int ay = int.Parse(yilAy[1]);
                DateTime bas = new DateTime(yil, ay, 1);
                DateTime bit = bas.AddMonths(1).AddDays(-1);

                sonuc = new FullCalendarJsonDataClass();
                sonuc.defaultDate = bas.ToString("yyyy-MM-dd");
                sonuc.firstDay = ((int)bas.DayOfWeek).ToString();
                sonuc.events = new List<FullCalendarJsonEventClass>();

                // Örnek: Her güne bir etkinlik ekle
                for (DateTime dt = bas; dt <= bit; dt = dt.AddDays(1))
                {
                    var tmp = new FullCalendarJsonEventClass();
                    tmp.title = $"Etkinlik {dt.Day}";
                    tmp.start = MainClass.DateTimeToStringCalendarFormat(dt);
                    tmp.end = MainClass.DateTimeToStringCalendarFormat(dt);
                    tmp.color = "#dd813e";
                    tmp.overlap = false;
                    sonuc.events.Add(tmp);
                }
            }
            catch (Exception ex)
            {
                sonuc = null;
                // logger class ile log gir
            }
            return sonuc;
        }


        public List<SelectJsonClass> ParametreGetir(string ParametreGrup,string BosStr,string Ip,Guid? UserId)
        {
            List<SelectJsonClass> sonuc = null;
            string Metod = "ParametreGetir";

            SelectJsonClass tmp = null;
            List<SelectJsonClass> tmpList = null;
            try
            {
                sonuc = new List<SelectJsonClass>();
                if (BosStr!=null)
                {
                    tmp = new SelectJsonClass();
                    tmp.text = BosStr;
                    tmp.id = "-1";
                    sonuc.Add(tmp);
                }

                using (db=new dbPdrMerEntities())
                {
                    tmpList = db.Parametreler.Where(a => a.ParametreGrup == ParametreGrup).Select(a=>  new SelectJsonClass {id=a.ParametreAdi,text=a.ParametreDeger }).OrderBy(a=> a.text).ToList() ;
                }
                if (tmpList!=null)
                {
                    sonuc.AddRange(tmpList);
                }
                

            }
            catch (Exception ex)
            {

                LoggerClass.ErrorLog(UserId,Metod,Ip,ex.ToString());
            }

            return sonuc;
        }


        public SessionDataClass Login(string KullaniciEpostasi, string Sifre, string Ip, Guid? UserId)
        {
            SessionDataClass sonuc = null;
            string Metod = "Login";
            Kullanicilar data;
            string SifreCozulmus;
            AESSinif ans = new AESSinif();
            try
            {
 
                
                using (db = new dbPdrMerEntities())
                {
                    data = db.Kullanicilar.Where(a => a.KullaniciEpostasi == KullaniciEpostasi).FirstOrDefault() ;
                    if (data!=null)
                    {
                        SifreCozulmus = ans.AESsifreCoz(data.KullaniciParolasi);
                        if (SifreCozulmus== Sifre)
                        {
                            sonuc = new SessionDataClass();
                            sonuc.KullaniciTipi = data.KullaniciTipi;
                            sonuc.AdiSoyadi = data.KullaniciAdiSoyadi;
                            sonuc.UserId = data.KullaniciGuidId.Value;
                           
                        }
                    }
                }
                


            }
            catch (Exception ex)
            {

                LoggerClass.ErrorLog(UserId, Metod, Ip, ex.ToString());
            }

            return sonuc;
        }

    }
}
﻿using BLL.RepositoryService;
using DAL;
using DAL.ConstString;
using DAL.Entities;
using DTO.BillDataModel;
using DTO.UserDataModel;
using System;
using System.Collections.Generic;
using System.Linq;

namespace BLL.BillService
{
    public class BillRepository : GenericRepository<Bill>, IBillRepository
    {
        public BillRepository(GeneralDBContext context)
            : base(context)
        {
        }

        public GeneralDBContext GeneralDBContext
        {
            get { return Context as GeneralDBContext; }
        }

        public Bill GetLastBill(int deviceId)
        {
            return GeneralDBContext.BillsDevices.AsNoTracking().Where(w => w.Bill.EndDate != null && w.DeviceID == deviceId).OrderByDescending(o => o.EndDate).FirstOrDefault()?.Bill;
        }

        public int GetRecordsNumber(string billCase, string key, DateTime dtFrom, DateTime dtTo)
        {
            if (UserData.Role == RoleText.Admin)
            {
                switch (billCase)
                {
                    case BillCaseText.All:
                        return GeneralDBContext.Bills.Where(w => w.EndDate != null && w.Type == BillTypeText.Devices && (w.ID.ToString() + w.Client.Name + w.User.Name + w.ID.ToString()).Contains(key) && w.Date >= dtFrom && w.Date <= dtTo).Count();
                    case BillCaseText.Available:
                        return GeneralDBContext.Bills.Where(w => w.Deleted == false && w.Canceled == false && w.EndDate != null && w.Type == BillTypeText.Devices && (w.ID.ToString() + w.Client.Name + w.User.Name + w.ID.ToString()).Contains(key) && w.Date >= dtFrom && w.Date <= dtTo).Count();
                    case BillCaseText.Canceled:
                        return GeneralDBContext.Bills.Where(w => w.Canceled == true && w.EndDate != null && w.Type == BillTypeText.Devices && (w.ID.ToString() + w.Client.Name + w.User.Name + w.ID.ToString()).Contains(key) && w.Date >= dtFrom && w.Date <= dtTo).Count();
                    case BillCaseText.Deleted:
                        return GeneralDBContext.Bills.Where(w => w.Deleted == true && w.EndDate != null && w.Type == BillTypeText.Devices && (w.ID.ToString() + w.Client.Name + w.User.Name + w.ID.ToString()).Contains(key) && w.Date >= dtFrom && w.Date <= dtTo).Count();
                    default:
                        return 0;
                }
            }
            else if (UserData.Role == RoleText.Tax)
            {
                switch (billCase)
                {
                    case BillCaseText.All:
                        return GeneralDBContext.Bills.Where(w => w.TotalAfterDiscount <= 30 && w.EndDate != null && w.Type == BillTypeText.Devices && (w.ID.ToString() + w.Client.Name + w.User.Name + w.ID.ToString()).Contains(key) && w.Date >= dtFrom && w.Date <= dtTo).Count();
                    case BillCaseText.Available:
                        return GeneralDBContext.Bills.Where(w => w.TotalAfterDiscount <= 30 && w.Deleted == false && w.Canceled == false && w.EndDate != null && w.Type == BillTypeText.Devices && (w.ID.ToString() + w.Client.Name + w.User.Name + w.ID.ToString()).Contains(key) && w.Date >= dtFrom && w.Date <= dtTo).Count();
                    case BillCaseText.Canceled:
                        return GeneralDBContext.Bills.Where(w => w.TotalAfterDiscount <= 30 && w.Canceled == true && w.EndDate != null && w.Type == BillTypeText.Devices && (w.ID.ToString() + w.Client.Name + w.User.Name + w.ID.ToString()).Contains(key) && w.Date >= dtFrom && w.Date <= dtTo).Count();
                    case BillCaseText.Deleted:
                        return GeneralDBContext.Bills.Where(w => w.TotalAfterDiscount <= 30 && w.Deleted == true && w.EndDate != null && w.Type == BillTypeText.Devices && (w.ID.ToString() + w.Client.Name + w.User.Name + w.ID.ToString()).Contains(key) && w.Date >= dtFrom && w.Date <= dtTo).Count();
                    default:
                        return 0;
                }
            }
            else
            {
                return 0;
            }
        }

        public List<BillDayDataModel> Search(DateTime date)
        {
            if (UserData.Role == RoleText.Admin)
            {
                return GeneralDBContext.Bills.AsNoTracking().Where(w => w.Deleted == false && w.Canceled == false && w.EndDate != null && w.Date == date && w.Type == BillTypeText.Devices).OrderBy(o => o.ID).Select(s => new BillDayDataModel
                {
                    Bill = s,
                    User = s.User,
                    Client = s.Client
                }).ToList();
            }
            else if (UserData.Role == RoleText.Tax)
            {
                return GeneralDBContext.Bills.AsNoTracking().Where(w => w.TotalAfterDiscount <= 30 && w.Deleted == false && w.Canceled == false && w.EndDate != null && w.Date == date && w.Type == BillTypeText.Devices).OrderBy(o => o.ID).Select(s => new BillDayDataModel
                {
                    Bill = s,
                    User = s.User,
                    Client = s.Client
                }).ToList();
            }
            else
            {
                return null;
            }
        }

        public List<BillDisplayDataModel> Search(string billCase, string key, DateTime dtFrom, DateTime dtTo, int pageNumber, int pageSize)
        {
            if (UserData.Role == RoleText.Admin)
            {
                switch (billCase)
                {
                    case BillCaseText.All:
                        return GeneralDBContext.Bills.Where(w => w.EndDate != null && w.Type == BillTypeText.Devices && (w.ID.ToString() + w.Client.Name + w.User.Name + w.ID.ToString()).Contains(key) && w.Date >= dtFrom && w.Date <= dtTo).OrderBy(o => o.ID).Skip((pageNumber - 1) * pageSize).Take(pageSize).Select(s => new BillDisplayDataModel
                        {
                            Bill = s,
                            User = s.User,
                            Client = s.Client,
                            Case = s.Canceled == true ? BillCaseText.Canceled : s.Deleted == true ? BillCaseText.Deleted : BillCaseText.Available
                        }).ToList();
                    case BillCaseText.Available:
                        return GeneralDBContext.Bills.Where(w => w.Deleted == false && w.Canceled == false && w.EndDate != null && w.Type == BillTypeText.Devices && (w.ID.ToString() + w.Client.Name + w.User.Name + w.ID.ToString()).Contains(key) && w.Date >= dtFrom && w.Date <= dtTo).OrderBy(o => o.ID).Skip((pageNumber - 1) * pageSize).Take(pageSize).Select(s => new BillDisplayDataModel
                        {
                            Bill = s,
                            User = s.User,
                            Client = s.Client,
                            Case = s.Canceled == true ? BillCaseText.Canceled : s.Deleted == true ? BillCaseText.Deleted : BillCaseText.Available
                        }).ToList();
                    case BillCaseText.Canceled:
                        return GeneralDBContext.Bills.Where(w => w.Canceled == true && w.EndDate != null && w.Type == BillTypeText.Devices && (w.ID.ToString() + w.Client.Name + w.User.Name + w.ID.ToString()).Contains(key) && w.Date >= dtFrom && w.Date <= dtTo).OrderBy(o => o.ID).Skip((pageNumber - 1) * pageSize).Take(pageSize).Select(s => new BillDisplayDataModel
                        {
                            Bill = s,
                            User = s.User,
                            Client = s.Client,
                            Case = s.Canceled == true ? BillCaseText.Canceled : s.Deleted == true ? BillCaseText.Deleted : BillCaseText.Available
                        }).ToList();
                    case BillCaseText.Deleted:
                        return GeneralDBContext.Bills.Where(w => w.Deleted == true && w.EndDate != null && w.Type == BillTypeText.Devices && (w.ID.ToString() + w.Client.Name + w.User.Name + w.ID.ToString()).Contains(key) && w.Date >= dtFrom && w.Date <= dtTo).OrderBy(o => o.ID).Skip((pageNumber - 1) * pageSize).Take(pageSize).Select(s => new BillDisplayDataModel
                        {
                            Bill = s,
                            User = s.User,
                            Client = s.Client,
                            Case = s.Canceled == true ? BillCaseText.Canceled : s.Deleted == true ? BillCaseText.Deleted : BillCaseText.Available
                        }).ToList();
                    default:
                        return null;
                }
            }

            else if (UserData.Role == RoleText.Tax)
            {
                switch (billCase)
                {
                    case BillCaseText.All:
                        return GeneralDBContext.Bills.Where(w => w.TotalAfterDiscount <= 30 && w.EndDate != null && w.Type == BillTypeText.Devices && (w.ID.ToString() + w.Client.Name + w.User.Name + w.ID.ToString()).Contains(key) && w.Date >= dtFrom && w.Date <= dtTo).OrderBy(o => o.ID).Skip((pageNumber - 1) * pageSize).Take(pageSize).Select(s => new BillDisplayDataModel
                        {
                            Bill = s,
                            User = s.User,
                            Client = s.Client,
                            Case = s.Canceled == true ? BillCaseText.Canceled : s.Deleted == true ? BillCaseText.Deleted : BillCaseText.Available
                        }).ToList();
                    case BillCaseText.Available:
                        return GeneralDBContext.Bills.Where(w => w.TotalAfterDiscount <= 30 && w.Deleted == false && w.Canceled == false && w.EndDate != null && w.Type == BillTypeText.Devices && (w.ID.ToString() + w.Client.Name + w.User.Name + w.ID.ToString()).Contains(key) && w.Date >= dtFrom && w.Date <= dtTo).OrderBy(o => o.ID).Skip((pageNumber - 1) * pageSize).Take(pageSize).Select(s => new BillDisplayDataModel
                        {
                            Bill = s,
                            User = s.User,
                            Client = s.Client,
                            Case = s.Canceled == true ? BillCaseText.Canceled : s.Deleted == true ? BillCaseText.Deleted : BillCaseText.Available
                        }).ToList();
                    case BillCaseText.Canceled:
                        return GeneralDBContext.Bills.Where(w => w.TotalAfterDiscount <= 30 && w.Canceled == true && w.EndDate != null && w.Type == BillTypeText.Devices && (w.ID.ToString() + w.Client.Name + w.User.Name + w.ID.ToString()).Contains(key) && w.Date >= dtFrom && w.Date <= dtTo).OrderBy(o => o.ID).Skip((pageNumber - 1) * pageSize).Take(pageSize).Select(s => new BillDisplayDataModel
                        {
                            Bill = s,
                            User = s.User,
                            Client = s.Client,
                            Case = s.Canceled == true ? BillCaseText.Canceled : s.Deleted == true ? BillCaseText.Deleted : BillCaseText.Available
                        }).ToList();
                    case BillCaseText.Deleted:
                        return GeneralDBContext.Bills.Where(w => w.TotalAfterDiscount <= 30 && w.Deleted == true && w.EndDate != null && w.Type == BillTypeText.Devices && (w.ID.ToString() + w.Client.Name + w.User.Name + w.ID.ToString()).Contains(key) && w.Date >= dtFrom && w.Date <= dtTo).OrderBy(o => o.ID).Skip((pageNumber - 1) * pageSize).Take(pageSize).Select(s => new BillDisplayDataModel
                        {
                            Bill = s,
                            User = s.User,
                            Client = s.Client,
                            Case = s.Canceled == true ? BillCaseText.Canceled : s.Deleted == true ? BillCaseText.Deleted : BillCaseText.Available
                        }).ToList();
                    default:
                        return null;
                }
            }
            else
                return null;
        }

        public decimal? DevicesSum(string billCase, string key, DateTime dtFrom, DateTime dtTo)
        {
            if (UserData.Role == RoleText.Admin)
            {
                switch (billCase)
                {
                    case BillCaseText.All:
                        return FindSum(w => w.EndDate != null && w.Type == BillTypeText.Devices && (w.ID.ToString() + w.Client.Name + w.User.Name + w.ID.ToString()).Contains(key) && w.Date >= dtFrom && w.Date <= dtTo && w.DevicesSum != null).Sum(s => s.DevicesSum);
                    case BillCaseText.Available:
                        return FindSum(w => w.Deleted == false && w.Canceled == false && w.EndDate != null && w.Type == BillTypeText.Devices && (w.ID.ToString() + w.Client.Name + w.User.Name + w.ID.ToString()).Contains(key) && w.Date >= dtFrom && w.Date <= dtTo && w.DevicesSum != null).Sum(s => s.DevicesSum);
                    case BillCaseText.Canceled:
                        return FindSum(w => w.Canceled == true && w.EndDate != null && w.Type == BillTypeText.Devices && (w.ID.ToString() + w.Client.Name + w.User.Name + w.ID.ToString()).Contains(key) && w.Date >= dtFrom && w.Date <= dtTo && w.DevicesSum != null).Sum(s => s.DevicesSum);
                    case BillCaseText.Deleted:
                        return FindSum(w => w.Deleted == true && w.EndDate != null && w.Type == BillTypeText.Devices && (w.ID.ToString() + w.Client.Name + w.User.Name + w.ID.ToString()).Contains(key) && w.Date >= dtFrom && w.Date <= dtTo && w.DevicesSum != null).Sum(s => s.DevicesSum);
                    default:
                        return null;
                }
            }

            else if (UserData.Role == RoleText.Tax)
            {
                switch (billCase)
                {
                    case BillCaseText.All:
                        return FindSum(w => w.TotalAfterDiscount <= 30 && w.EndDate != null && w.Type == BillTypeText.Devices && (w.ID.ToString() + w.Client.Name + w.User.Name + w.ID.ToString()).Contains(key) && w.Date >= dtFrom && w.Date <= dtTo && w.DevicesSum != null).Sum(s => s.DevicesSum);
                    case BillCaseText.Available:
                        return FindSum(w => w.TotalAfterDiscount <= 30 && w.Deleted == false && w.Canceled == false && w.EndDate != null && w.Type == BillTypeText.Devices && (w.ID.ToString() + w.Client.Name + w.User.Name + w.ID.ToString()).Contains(key) && w.Date >= dtFrom && w.Date <= dtTo && w.DevicesSum != null).Sum(s => s.DevicesSum);
                    case BillCaseText.Canceled:
                        return FindSum(w => w.TotalAfterDiscount <= 30 && w.Canceled == true && w.EndDate != null && w.Type == BillTypeText.Devices && (w.ID.ToString() + w.Client.Name + w.User.Name + w.ID.ToString()).Contains(key) && w.Date >= dtFrom && w.Date <= dtTo && w.DevicesSum != null).Sum(s => s.DevicesSum);
                    case BillCaseText.Deleted:
                        return FindSum(w => w.TotalAfterDiscount <= 30 && w.Deleted == true && w.EndDate != null && w.Type == BillTypeText.Devices && (w.ID.ToString() + w.Client.Name + w.User.Name + w.ID.ToString()).Contains(key) && w.Date >= dtFrom && w.Date <= dtTo && w.DevicesSum != null).Sum(s => s.DevicesSum);
                    default:
                        return null;
                }
            }
            else
                return null;
        }

        public decimal? ItemsSum(string billCase, string key, DateTime dtFrom, DateTime dtTo)
        {
            if (UserData.Role == RoleText.Admin)
            {
                switch (billCase)
                {
                    case BillCaseText.All:
                        return FindSum(w => w.EndDate != null && w.Type == BillTypeText.Devices && (w.ID.ToString() + w.Client.Name + w.User.Name + w.ID.ToString()).Contains(key) && w.Date >= dtFrom && w.Date <= dtTo && w.ItemsSum != null).Sum(s => s.ItemsSum);
                    case BillCaseText.Available:
                        return FindSum(w => w.Deleted == false && w.Canceled == false && w.EndDate != null && w.Type == BillTypeText.Devices && (w.ID.ToString() + w.Client.Name + w.User.Name + w.ID.ToString()).Contains(key) && w.Date >= dtFrom && w.Date <= dtTo && w.ItemsSum != null).Sum(s => s.ItemsSum);
                    case BillCaseText.Canceled:
                        return FindSum(w => w.Canceled == true && w.EndDate != null && w.Type == BillTypeText.Devices && (w.ID.ToString() + w.Client.Name + w.User.Name + w.ID.ToString()).Contains(key) && w.Date >= dtFrom && w.Date <= dtTo && w.ItemsSum != null).Sum(s => s.ItemsSum);
                    case BillCaseText.Deleted:
                        return FindSum(w => w.Deleted == true && w.EndDate != null && w.Type == BillTypeText.Devices && (w.ID.ToString() + w.Client.Name + w.User.Name + w.ID.ToString()).Contains(key) && w.Date >= dtFrom && w.Date <= dtTo && w.ItemsSum != null).Sum(s => s.ItemsSum);
                    default:
                        return null;
                }
            }

            else if (UserData.Role == RoleText.Tax)
            {
                switch (billCase)
                {
                    case BillCaseText.All:
                        return FindSum(w => w.TotalAfterDiscount <= 30 && w.EndDate != null && w.Type == BillTypeText.Devices && (w.ID.ToString() + w.Client.Name + w.User.Name + w.ID.ToString()).Contains(key) && w.Date >= dtFrom && w.Date <= dtTo && w.ItemsSum != null).Sum(s => s.ItemsSum);
                    case BillCaseText.Available:
                        return FindSum(w => w.TotalAfterDiscount <= 30 && w.Deleted == false && w.Canceled == false && w.EndDate != null && w.Type == BillTypeText.Devices && (w.ID.ToString() + w.Client.Name + w.User.Name + w.ID.ToString()).Contains(key) && w.Date >= dtFrom && w.Date <= dtTo && w.ItemsSum != null).Sum(s => s.ItemsSum);
                    case BillCaseText.Canceled:
                        return FindSum(w => w.TotalAfterDiscount <= 30 && w.Canceled == true && w.EndDate != null && w.Type == BillTypeText.Devices && (w.ID.ToString() + w.Client.Name + w.User.Name + w.ID.ToString()).Contains(key) && w.Date >= dtFrom && w.Date <= dtTo && w.ItemsSum != null).Sum(s => s.ItemsSum);
                    case BillCaseText.Deleted:
                        return FindSum(w => w.TotalAfterDiscount <= 30 && w.Deleted == true && w.EndDate != null && w.Type == BillTypeText.Devices && (w.ID.ToString() + w.Client.Name + w.User.Name + w.ID.ToString()).Contains(key) && w.Date >= dtFrom && w.Date <= dtTo && w.ItemsSum != null).Sum(s => s.ItemsSum);
                    default:
                        return null;
                }
            }
            else
                return null;

        }

        public decimal? DiscountSum(string billCase, string key, DateTime dtFrom, DateTime dtTo)
        {
            if (UserData.Role == RoleText.Admin)
            {
                switch (billCase)
                {
                    case BillCaseText.All:
                        return FindSum(w => w.EndDate != null && w.Type == BillTypeText.Devices && (w.ID.ToString() + w.Client.Name + w.User.Name + w.ID.ToString()).Contains(key) && w.Date >= dtFrom && w.Date <= dtTo && w.Discount != null).Sum(s => s.Discount);
                    case BillCaseText.Available:
                        return FindSum(w => w.Deleted == false && w.Canceled == false && w.EndDate != null && w.Type == BillTypeText.Devices && (w.ID.ToString() + w.Client.Name + w.User.Name + w.ID.ToString()).Contains(key) && w.Date >= dtFrom && w.Date <= dtTo && w.Discount != null).Sum(s => s.Discount);
                    case BillCaseText.Canceled:
                        return FindSum(w => w.Canceled == true && w.EndDate != null && w.Type == BillTypeText.Devices && (w.ID.ToString() + w.Client.Name + w.User.Name + w.ID.ToString()).Contains(key) && w.Date >= dtFrom && w.Date <= dtTo && w.Discount != null).Sum(s => s.Discount);
                    case BillCaseText.Deleted:
                        return FindSum(w => w.Deleted == true && w.EndDate != null && w.Type == BillTypeText.Devices && (w.ID.ToString() + w.Client.Name + w.User.Name + w.ID.ToString()).Contains(key) && w.Date >= dtFrom && w.Date <= dtTo && w.Discount != null).Sum(s => s.Discount);
                    default:
                        return null;
                }
            }

            else if (UserData.Role == RoleText.Tax)
            {
                switch (billCase)
                {
                    case BillCaseText.All:
                        return FindSum(w => w.TotalAfterDiscount <= 30 && w.EndDate != null && w.Type == BillTypeText.Devices && (w.ID.ToString() + w.Client.Name + w.User.Name + w.ID.ToString()).Contains(key) && w.Date >= dtFrom && w.Date <= dtTo && w.Discount != null).Sum(s => s.Discount);
                    case BillCaseText.Available:
                        return FindSum(w => w.TotalAfterDiscount <= 30 && w.Deleted == false && w.Canceled == false && w.EndDate != null && w.Type == BillTypeText.Devices && (w.ID.ToString() + w.Client.Name + w.User.Name + w.ID.ToString()).Contains(key) && w.Date >= dtFrom && w.Date <= dtTo && w.Discount != null).Sum(s => s.Discount);
                    case BillCaseText.Canceled:
                        return FindSum(w => w.TotalAfterDiscount <= 30 && w.Canceled == true && w.EndDate != null && w.Type == BillTypeText.Devices && (w.ID.ToString() + w.Client.Name + w.User.Name + w.ID.ToString()).Contains(key) && w.Date >= dtFrom && w.Date <= dtTo && w.Discount != null).Sum(s => s.Discount);
                    case BillCaseText.Deleted:
                        return FindSum(w => w.TotalAfterDiscount <= 30 && w.Deleted == true && w.EndDate != null && w.Type == BillTypeText.Devices && (w.ID.ToString() + w.Client.Name + w.User.Name + w.ID.ToString()).Contains(key) && w.Date >= dtFrom && w.Date <= dtTo && w.ItemsSum != null).Sum(s => s.ItemsSum);
                    default:
                        return null;
                }
            }
            else
                return null;
        }

        public decimal? TotalAfterDiscountSum(string billCase, string key, DateTime dtFrom, DateTime dtTo)
        {

            if (UserData.Role == RoleText.Admin)
            {
                switch (billCase)
                {
                    case BillCaseText.All:
                        return FindSum(w => w.EndDate != null && w.Type == BillTypeText.Devices && (w.ID.ToString() + w.Client.Name + w.User.Name + w.ID.ToString()).Contains(key) && w.Date >= dtFrom && w.Date <= dtTo && w.TotalAfterDiscount != null).Sum(s => s.TotalAfterDiscount);
                    case BillCaseText.Available:
                        return FindSum(w => w.Deleted == false && w.Canceled == false && w.EndDate != null && w.Type == BillTypeText.Devices && (w.ID.ToString() + w.Client.Name + w.User.Name + w.ID.ToString()).Contains(key) && w.Date >= dtFrom && w.Date <= dtTo && w.TotalAfterDiscount != null).Sum(s => s.TotalAfterDiscount);
                    case BillCaseText.Canceled:
                        return FindSum(w => w.Canceled == true && w.EndDate != null && w.Type == BillTypeText.Devices && (w.ID.ToString() + w.Client.Name + w.User.Name + w.ID.ToString()).Contains(key) && w.Date >= dtFrom && w.Date <= dtTo && w.TotalAfterDiscount != null).Sum(s => s.TotalAfterDiscount);
                    case BillCaseText.Deleted:
                        return FindSum(w => w.Deleted == true && w.EndDate != null && w.Type == BillTypeText.Devices && (w.ID.ToString() + w.Client.Name + w.User.Name + w.ID.ToString()).Contains(key) && w.Date >= dtFrom && w.Date <= dtTo && w.TotalAfterDiscount != null).Sum(s => s.TotalAfterDiscount);
                    default:
                        return null;
                }
            }

            else if (UserData.Role == RoleText.Tax)
            {
                switch (billCase)
                {
                    case BillCaseText.All:
                        return FindSum(w => w.TotalAfterDiscount <= 30 && w.EndDate != null && w.Type == BillTypeText.Devices && (w.ID.ToString() + w.Client.Name + w.User.Name + w.ID.ToString()).Contains(key) && w.Date >= dtFrom && w.Date <= dtTo && w.TotalAfterDiscount != null).Sum(s => s.TotalAfterDiscount);
                    case BillCaseText.Available:
                        return FindSum(w => w.TotalAfterDiscount <= 30 && w.Deleted == false && w.Canceled == false && w.EndDate != null && w.Type == BillTypeText.Devices && (w.ID.ToString() + w.Client.Name + w.User.Name + w.ID.ToString()).Contains(key) && w.Date >= dtFrom && w.Date <= dtTo && w.TotalAfterDiscount != null).Sum(s => s.TotalAfterDiscount);
                    case BillCaseText.Canceled:
                        return FindSum(w => w.TotalAfterDiscount <= 30 && w.Canceled == true && w.EndDate != null && w.Type == BillTypeText.Devices && (w.ID.ToString() + w.Client.Name + w.User.Name + w.ID.ToString()).Contains(key) && w.Date >= dtFrom && w.Date <= dtTo && w.TotalAfterDiscount != null).Sum(s => s.TotalAfterDiscount);
                    case BillCaseText.Deleted:
                        return FindSum(w => w.TotalAfterDiscount <= 30 && w.Deleted == true && w.EndDate != null && w.Type == BillTypeText.Devices && (w.ID.ToString() + w.Client.Name + w.User.Name + w.ID.ToString()).Contains(key) && w.Date >= dtFrom && w.Date <= dtTo && w.TotalAfterDiscount != null).Sum(s => s.TotalAfterDiscount);
                    default:
                        return null;
                }
            }
            else
                return null;
        }

        public List<Bill> Search(string billCase, string key, DateTime dtFrom, DateTime dtTo)
        {
            if (UserData.Role == RoleText.Admin)
            {
                switch (billCase)
                {
                    case BillCaseText.All:
                        return GeneralDBContext.Bills.Where(w => w.EndDate != null && w.Type == BillTypeText.Devices && (w.ID.ToString() + w.Client.Name + w.User.Name + w.ID.ToString()).Contains(key) && w.Date >= dtFrom && w.Date <= dtTo).OrderBy(o => o.ID).ToList();
                    case BillCaseText.Available:
                        return GeneralDBContext.Bills.Where(w => w.Deleted == false && w.Canceled == false && w.EndDate != null && w.Type == BillTypeText.Devices && (w.ID.ToString() + w.Client.Name + w.User.Name + w.ID.ToString()).Contains(key) && w.Date >= dtFrom && w.Date <= dtTo).OrderBy(o => o.ID).ToList();
                    case BillCaseText.Canceled:
                        return GeneralDBContext.Bills.Where(w => w.Canceled == true && w.EndDate != null && w.Type == BillTypeText.Devices && (w.ID.ToString() + w.Client.Name + w.User.Name + w.ID.ToString()).Contains(key) && w.Date >= dtFrom && w.Date <= dtTo).OrderBy(o => o.ID).ToList();
                    case BillCaseText.Deleted:
                        return GeneralDBContext.Bills.Where(w => w.Deleted == true && w.EndDate != null && w.Type == BillTypeText.Devices && (w.ID.ToString() + w.Client.Name + w.User.Name + w.ID.ToString()).Contains(key) && w.Date >= dtFrom && w.Date <= dtTo).OrderBy(o => o.ID).ToList();
                    default:
                        return null;
                }
            }

            else if (UserData.Role == RoleText.Tax)
            {
                switch (billCase)
                {
                    case BillCaseText.All:
                        return GeneralDBContext.Bills.Where(w => w.TotalAfterDiscount <= 30 && w.EndDate != null && w.Type == BillTypeText.Devices && (w.ID.ToString() + w.Client.Name + w.User.Name + w.ID.ToString()).Contains(key) && w.Date >= dtFrom && w.Date <= dtTo).OrderBy(o => o.ID).ToList();
                    case BillCaseText.Available:
                        return GeneralDBContext.Bills.Where(w => w.TotalAfterDiscount <= 30 && w.Deleted == false && w.Canceled == false && w.EndDate != null && w.Type == BillTypeText.Devices && (w.ID.ToString() + w.Client.Name + w.User.Name + w.ID.ToString()).Contains(key) && w.Date >= dtFrom && w.Date <= dtTo).OrderBy(o => o.ID).ToList();
                    case BillCaseText.Canceled:
                        return GeneralDBContext.Bills.Where(w => w.TotalAfterDiscount <= 30 && w.Canceled == true && w.EndDate != null && w.Type == BillTypeText.Devices && (w.ID.ToString() + w.Client.Name + w.User.Name + w.ID.ToString()).Contains(key) && w.Date >= dtFrom && w.Date <= dtTo).OrderBy(o => o.ID).ToList();
                    case BillCaseText.Deleted:
                        return GeneralDBContext.Bills.Where(w => w.TotalAfterDiscount <= 30 && w.Deleted == true && w.EndDate != null && w.Type == BillTypeText.Devices && (w.ID.ToString() + w.Client.Name + w.User.Name + w.ID.ToString()).Contains(key) && w.Date >= dtFrom && w.Date <= dtTo).OrderBy(o => o.ID).ToList();
                    default:
                        return null;
                }
            }
            else
                return null;

        }

    }
}

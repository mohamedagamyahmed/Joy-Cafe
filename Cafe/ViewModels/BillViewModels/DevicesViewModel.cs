﻿using BLL.UnitOfWorkService;
using Cafe.Views.BillViews.AccountPaidViews;
using Cafe.Views.BillViews.BillClientViews;
using Cafe.Views.BillViews.BillItemsViews;
using Cafe.Views.BillViews.FinishShiftViews;
using Cafe.Views.BillViews.ShiftItemsViews;
using Cafe.Views.BillViews.ShiftSpendingViews;
using DAL;
using DAL.BindableBaseService;
using DAL.ConstString;
using DAL.Entities;
using DTO.BillDataModel;
using DTO.BillDeviceDataModel;
using DTO.BillItemDataModel;
using DTO.ClientDataModel;
using DTO.DeviceDataModel;
using DTO.MainDataModel;
using DTO.ShiftDataModel;
using DTO.UserDataModel;
using GalaSoft.MvvmLight.CommandWpf;
using MahApps.Metro.Controls;
using MahApps.Metro.Controls.Dialogs;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data.Entity;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Windows;
using System.Windows.Input;
using System.Windows.Threading;

namespace Cafe.ViewModels.BillViewModels
{
    public class DevicesViewModel : ValidatableBindableBase
    {
        MetroWindow currentWindow;

        private readonly ClientAddDialog clientAddDialog;
        private readonly ClientCheckDialog clientCheckDialog;
        private readonly FinishShiftDialog finishShiftDialog;
        private readonly FinishShiftConfirmDialog finishShiftConfirmDialog;

        public DevicesViewModel()
        {
            UserData.newShift = false;
            _timer = new DispatcherTimer(DispatcherPriority.Render);
            _timer.Interval = TimeSpan.FromSeconds(1);
            _timer.Tick += (sender, args) =>
            {
                CurrentTime = DateTime.Now.ToLongTimeString();
            };
            _timer.Start();

            _isFocused = true;
            _accountVisibility = Visibility.Collapsed;
            _freeDevicesVisibility = Visibility.Collapsed;
            _availableDevicesVisibility = Visibility.Visible;
            clientAddDialog = new ClientAddDialog();
            clientCheckDialog = new ClientCheckDialog();
            finishShiftDialog = new FinishShiftDialog();
            finishShiftConfirmDialog = new FinishShiftConfirmDialog();
            currentWindow = Application.Current.Windows.OfType<MetroWindow>().LastOrDefault();

        }

        private bool _isFocused;
        public bool IsFocused
        {
            get { return _isFocused; }
            set { SetProperty(ref _isFocused, value); }
        }

        // Time 

        private string _currentTime;

        public DispatcherTimer _timer;

        public string CurrentTime
        {
            get
            {
                return this._currentTime;
            }
            set
            {
                if (_currentTime == value)
                    return;
                _currentTime = value;
                OnPropertyChanged("CurrentTime");
            }
        }

        // Grid Display

        private Visibility _accountVisibility;
        public Visibility AccountVisibility
        {
            get { return _accountVisibility; }
            set { SetProperty(ref _accountVisibility, value); }
        }

        private Visibility _freeDevicesVisibility;
        public Visibility FreeDevicesVisibility
        {
            get { return _freeDevicesVisibility; }
            set { SetProperty(ref _freeDevicesVisibility, value); }
        }

        private Visibility _availableDevicesVisibility;
        public Visibility AvailableDevicesVisibility
        {
            get { return _availableDevicesVisibility; }
            set { SetProperty(ref _availableDevicesVisibility, value); }
        }

        // Device Case 

        private Visibility _clickVisibility;
        public Visibility ClickVisibility
        {
            get { return _clickVisibility; }
            set { SetProperty(ref _clickVisibility, value); }
        }

        private Visibility _startVisibility;
        public Visibility StartVisibility
        {
            get { return _startVisibility; }
            set { SetProperty(ref _startVisibility, value); }
        }

        private Visibility _stopVisibility;
        public Visibility StopVisibility
        {
            get { return _stopVisibility; }
            set { SetProperty(ref _stopVisibility, value); }
        }

        private Visibility _birthdayVisibility;
        public Visibility BirthdayVisibility
        {
            get { return _birthdayVisibility; }
            set { SetProperty(ref _birthdayVisibility, value); }
        }

        private Visibility _singleVisibility;
        public Visibility SingleVisibility
        {
            get { return _singleVisibility; }
            set { SetProperty(ref _singleVisibility, value); }
        }

        private Visibility _multiVisibility;
        public Visibility MultiVisibility
        {
            get { return _multiVisibility; }
            set { SetProperty(ref _multiVisibility, value); }
        }

        private Visibility _temporaryVisibility;
        public Visibility TemporaryVisibility
        {
            get { return _temporaryVisibility; }
            set { SetProperty(ref _temporaryVisibility, value); }
        }

        private Visibility _resumeVisibility;
        public Visibility ResumeVisibility
        {
            get { return _resumeVisibility; }
            set { SetProperty(ref _resumeVisibility, value); }
        }

        // Device Cases Count

        private int _temporaryDevices;
        public int TemporaryDevices
        {
            get { return _temporaryDevices; }
            set { SetProperty(ref _temporaryDevices, value); }
        }

        private int _availableDevices;
        public int AvailableDevices
        {
            get { return _availableDevices; }
            set { SetProperty(ref _availableDevices, value); }
        }

        private int _busyDevices;
        public int BusyDevices
        {
            get { return _busyDevices; }
            set { SetProperty(ref _busyDevices, value); }
        }

        // Bill Account

        private decimal _devicesSum;
        public decimal DevicesSum
        {
            get
            {
                if (BillDevices != null)
                    return _devicesSum = BillDevices.Sum(s => Convert.ToDecimal(s.Total));
                else
                    return 0;
            }
        }

        private decimal _itemsSum;
        public decimal ItemsSum
        {
            get
            {
                if (BillItems != null)
                    return _itemsSum = BillItems.Sum(s => Convert.ToDecimal(s.BillItem.Total));
                else
                    return 0;
            }
        }

        private decimal _totalSum;
        public decimal TotalSum
        {
            get { return _totalSum = ItemsSum + DevicesSum; }
        }

        private ClientBillAddDataModel _newClient;
        public ClientBillAddDataModel NewClient
        {
            get { return _newClient; }
            set { SetProperty(ref _newClient, value); }
        }

        private DevicePlayDataModel _selectedDevice;
        public DevicePlayDataModel SelectedDevice
        {
            get { return _selectedDevice; }
            set { SetProperty(ref _selectedDevice, value); }
        }

        private ClientCheckDataModel _clientCheck;
        public ClientCheckDataModel ClientCheck
        {
            get { return _clientCheck; }
            set { SetProperty(ref _clientCheck, value); }
        }

        private LoginDataModel _loginModel;
        public LoginDataModel LoginModel
        {
            get { return _loginModel; }
            set { SetProperty(ref _loginModel, value); }
        }

        private FinishShiftDataModel _shift;
        public FinishShiftDataModel Shift
        {
            get { return _shift; }
            set { SetProperty(ref _shift, value); }
        }

        private List<string> _telephoneSuggestions;
        public List<string> TelephoneSuggestions
        {
            get { return _telephoneSuggestions; }
            set { SetProperty(ref _telephoneSuggestions, value); }
        }

        // Devices

        private ObservableCollection<DeviceFreeDataModel> _freeDevices;
        public ObservableCollection<DeviceFreeDataModel> FreeDevices
        {
            get { return _freeDevices; }
            set { SetProperty(ref _freeDevices, value); }
        }

        private ObservableCollection<DevicePlayDataModel> _devices;
        public ObservableCollection<DevicePlayDataModel> Devices
        {
            get { return _devices; }
            set { SetProperty(ref _devices, value); }
        }

        private ObservableCollection<BillItemsDisplayDataModel> _billItems;
        public ObservableCollection<BillItemsDisplayDataModel> BillItems
        {
            get { return _billItems; }
            set
            {
                SetProperty(ref _billItems, value);
                OnPropertyChanged("ItemsSum");
                OnPropertyChanged("TotalSum");
            }
        }

        private ObservableCollection<BillDevicesDisplayDataModel> _billDevices;
        public ObservableCollection<BillDevicesDisplayDataModel> BillDevices
        {
            get { return _billDevices; }
            set
            {
                SetProperty(ref _billDevices, value);
                OnPropertyChanged("DevicesSum");
                OnPropertyChanged("TotalSum");
            }
        }

        // Device Show

        private RelayCommand _loaded;
        public RelayCommand Loaded
        {
            get
            {
                return _loaded
                    ?? (_loaded = new RelayCommand(LoadedMethod));
            }
        }
        private void LoadedMethod()
        {
            try
            {
                using (var unitOfWork = new UnitOfWork(new GeneralDBContext()))
                {
                    Devices = new ObservableCollection<DevicePlayDataModel>(unitOfWork.Devices.GetAvailable());
                    BusyDevices = _devices.Where(w => w.Device.Case == CaseText.Busy).Count();
                    AvailableDevices = _devices.Where(w => w.Device.Case == CaseText.Free).Count();
                    TemporaryDevices = _devices.Where(w => w.Device.Case == CaseText.Paused).Count();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        private RelayCommand _check;
        public RelayCommand Check
        {
            get
            {
                return _check
                    ?? (_check = new RelayCommand(CheckMethod));
            }
        }
        private void CheckMethod()
        {
            try
            {
                if (SelectedDevice == null)
                {
                    SingleVisibility = Visibility.Collapsed;
                    MultiVisibility = Visibility.Collapsed;
                    BirthdayVisibility = Visibility.Collapsed;
                    ResumeVisibility = Visibility.Collapsed;
                    TemporaryVisibility = Visibility.Collapsed;
                    StartVisibility = Visibility.Collapsed;
                    StopVisibility = Visibility.Collapsed;
                    return;
                }
                    

                SingleVisibility = Visibility.Visible;
                MultiVisibility = Visibility.Visible;
                BirthdayVisibility = Visibility.Visible;

                if (_selectedDevice.Device.Case != CaseText.Free)
                {
                    StartVisibility = Visibility.Collapsed;
                    StopVisibility = Visibility.Visible;
                }
                else
                {
                    StartVisibility = Visibility.Visible;
                    StopVisibility = Visibility.Collapsed;
                }
                if (_selectedDevice.DeviceType.Birthday && _selectedDevice.GameType != GamePlayTypeText.Birthday)
                    BirthdayVisibility = Visibility.Visible;
                else
                    BirthdayVisibility = Visibility.Collapsed;

                if (_selectedDevice.GameType == GamePlayTypeText.Single)
                    SingleVisibility = Visibility.Collapsed;
                if (_selectedDevice.GameType == GamePlayTypeText.Multi)
                    MultiVisibility = Visibility.Collapsed;

                if (_selectedDevice.Device.Case == CaseText.Free)
                {
                    ResumeVisibility = Visibility.Collapsed;
                    TemporaryVisibility = Visibility.Collapsed;
                }
                else if (_selectedDevice.Device.Case == CaseText.Paused)
                {
                    ResumeVisibility = Visibility.Visible;
                    TemporaryVisibility = Visibility.Collapsed;
                }
                else
                {
                    ResumeVisibility = Visibility.Collapsed;
                    TemporaryVisibility = Visibility.Visible;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        private RelayCommand<string> _start;
        public RelayCommand<string> Start
        {
            get
            {
                return _start
                    ?? (_start = new RelayCommand<string>(ExecuteStart));
            }
        }
        private void ExecuteStart(string parameter)
        {
            try
            {
                if (SelectedDevice == null)
                    return;
                using (var unitOfWork = new UnitOfWork(new GeneralDBContext()))
                {
                    Bill bill = new Bill
                    {
                        StartDate = DateTime.Now,
                        Type = GeneralText.Devices
                    };
                    unitOfWork.Bills.Add(bill);

                    _selectedDevice.Device.Case = CaseText.Busy;
                    _selectedDevice.Device.BillID = bill.ID;
                    unitOfWork.Devices.Edit(_selectedDevice.Device);
                    BillDevice newBillDevice = null;
                    switch (parameter)
                    {
                        case GamePlayTypeText.Single:

                            newBillDevice = new BillDevice
                            {
                                StartDate = DateTime.Now,
                                GameType = GamePlayTypeText.Single,
                                MinutePrice = _selectedDevice.DeviceType.SingleMinutePrice,
                                BillID = bill.ID,
                                DeviceID = _selectedDevice.Device.ID
                            };
                            break;

                        case GamePlayTypeText.Multi:

                            newBillDevice = new BillDevice
                            {
                                StartDate = DateTime.Now,
                                GameType = GamePlayTypeText.Multi,
                                MinutePrice = _selectedDevice.DeviceType.MultiMinutePrice,
                                BillID = bill.ID,
                                DeviceID = _selectedDevice.Device.ID
                            };
                            break;

                        case GamePlayTypeText.Birthday:

                            newBillDevice = new BillDevice
                            {
                                StartDate = DateTime.Now,
                                GameType = GamePlayTypeText.Birthday,
                                MinutePrice = _selectedDevice.DeviceType.BirthdayMinutePrice,
                                BillID = bill.ID,
                                DeviceID = _selectedDevice.Device.ID
                            };
                            break;

                        default:
                            break;
                    }

                    unitOfWork.BillsDevices.Add(newBillDevice);
                    unitOfWork.Complete();
                    Devices = new ObservableCollection<DevicePlayDataModel>(unitOfWork.Devices.GetAvailable());
                    BusyDevices = _devices.Where(w => w.Device.Case == CaseText.Busy).Count();
                    AvailableDevices = _devices.Where(w => w.Device.Case == CaseText.Free).Count();
                    TemporaryDevices = _devices.Where(w => w.Device.Case == CaseText.Paused).Count();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        private RelayCommand<string> _change;
        public RelayCommand<string> Change
        {
            get
            {
                return _change
                    ?? (_change = new RelayCommand<string>(ExecuteChange));
            }
        }
        private void ExecuteChange(string parameter)
        {
            try
            {
                if (SelectedDevice == null)
                    return;
                using (var unitOfWork = new UnitOfWork(new GeneralDBContext()))
                {
                    if (_selectedDevice.Device.Case == CaseText.Busy)
                    {
                        BillDevice selectedBillDevice = unitOfWork.BillsDevices.FirstOrDefault(w => w.BillID == _selectedDevice.Device.BillID && w.EndDate == null);
                        selectedBillDevice.EndDate = DateTime.Now;
                        selectedBillDevice.Duration = Convert.ToInt32((Convert.ToDateTime(selectedBillDevice.EndDate) - selectedBillDevice.StartDate).TotalMinutes);
                        unitOfWork.BillsDevices.Edit(selectedBillDevice);
                    }
                    else
                    {
                        _selectedDevice.Device.Case = CaseText.Busy;
                        unitOfWork.Devices.Edit(_selectedDevice.Device);
                    }
                    BillDevice newBillDevice = null;
                    switch (parameter)
                    {
                        case GamePlayTypeText.Single:

                            newBillDevice = new BillDevice
                            {
                                StartDate = DateTime.Now,
                                GameType = GamePlayTypeText.Single,
                                MinutePrice = _selectedDevice.DeviceType.SingleMinutePrice,
                                BillID = Convert.ToInt32(_selectedDevice.Device.BillID),
                                DeviceID = _selectedDevice.Device.ID
                            };

                            break;

                        case GamePlayTypeText.Multi:

                            newBillDevice = new BillDevice
                            {
                                StartDate = DateTime.Now,
                                GameType = GamePlayTypeText.Multi,
                                MinutePrice = _selectedDevice.DeviceType.MultiMinutePrice,
                                BillID = Convert.ToInt32(_selectedDevice.Device.BillID),
                                DeviceID = _selectedDevice.Device.ID
                            };

                            break;

                        case GamePlayTypeText.Birthday:

                            newBillDevice = new BillDevice
                            {
                                StartDate = DateTime.Now,
                                GameType = GamePlayTypeText.Birthday,
                                MinutePrice = _selectedDevice.DeviceType.BirthdayMinutePrice,
                                BillID = Convert.ToInt32(_selectedDevice.Device.BillID),
                                DeviceID = _selectedDevice.Device.ID
                            };

                            break;

                        default:
                            break;
                    }

                    unitOfWork.BillsDevices.Add(newBillDevice);
                    unitOfWork.Complete();
                    Devices = new ObservableCollection<DevicePlayDataModel>(unitOfWork.Devices.GetAvailable());
                    BusyDevices = _devices.Where(w => w.Device.Case == CaseText.Busy).Count();
                    AvailableDevices = _devices.Where(w => w.Device.Case == CaseText.Free).Count();
                    TemporaryDevices = _devices.Where(w => w.Device.Case == CaseText.Paused).Count();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        private RelayCommand _temporaryStop;
        public RelayCommand TemporaryStop
        {
            get
            {
                return _temporaryStop
                    ?? (_temporaryStop = new RelayCommand(TemporaryStopMethod));
            }
        }
        private void TemporaryStopMethod()
        {
            try
            {
                if (SelectedDevice == null)
                    return;

                using (var unitOfWork = new UnitOfWork(new GeneralDBContext()))
                {
                    _selectedDevice.Device.Case = CaseText.Paused;
                    unitOfWork.Devices.Edit(_selectedDevice.Device);
                    BillDevice selectedBillDevice = unitOfWork.BillsDevices.FirstOrDefault(s => s.BillID == _selectedDevice.Device.BillID && s.EndDate == null);
                    selectedBillDevice.EndDate = DateTime.Now;
                    selectedBillDevice.Duration = Convert.ToInt32((Convert.ToDateTime(selectedBillDevice.EndDate) - selectedBillDevice.StartDate).TotalMinutes);
                    unitOfWork.BillsDevices.Edit(selectedBillDevice);
                    unitOfWork.Complete();

                    Devices = new ObservableCollection<DevicePlayDataModel>(unitOfWork.Devices.GetAvailable());
                    BusyDevices = _devices.Where(w => w.Device.Case == CaseText.Busy).Count();
                    AvailableDevices = _devices.Where(w => w.Device.Case == CaseText.Free).Count();
                    TemporaryDevices = _devices.Where(w => w.Device.Case == CaseText.Paused).Count();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        private RelayCommand _resume;
        public RelayCommand Resume
        {
            get
            {
                return _resume
                    ?? (_resume = new RelayCommand(ResumeMethod));
            }
        }
        private void ResumeMethod()
        {
            try
            {
                if (SelectedDevice == null)
                    return;

                using (var unitOfWork = new UnitOfWork(new GeneralDBContext()))
                {
                    _selectedDevice.Device.Case = CaseText.Busy;
                    unitOfWork.Devices.Edit(_selectedDevice.Device);

                    BillDevice selectedBillDevice = unitOfWork.BillsDevices.GetLast((int)_selectedDevice.Device.BillID);
                    BillDevice newBillDevice = null;

                    switch (selectedBillDevice.GameType)
                    {
                        case GamePlayTypeText.Single:

                            newBillDevice = new BillDevice
                            {
                                StartDate = DateTime.Now,
                                GameType = GamePlayTypeText.Single,
                                MinutePrice = _selectedDevice.DeviceType.SingleMinutePrice,
                                BillID = Convert.ToInt32(_selectedDevice.Device.BillID),
                                DeviceID = _selectedDevice.Device.ID
                            };

                            break;

                        case GamePlayTypeText.Multi:

                            newBillDevice = new BillDevice
                            {
                                StartDate = DateTime.Now,
                                GameType = GamePlayTypeText.Multi,
                                MinutePrice = _selectedDevice.DeviceType.MultiMinutePrice,
                                BillID = Convert.ToInt32(_selectedDevice.Device.BillID),
                                DeviceID = _selectedDevice.Device.ID
                            };

                            break;

                        case GamePlayTypeText.Birthday:

                            newBillDevice = new BillDevice
                            {
                                StartDate = DateTime.Now,
                                GameType = GamePlayTypeText.Birthday,
                                MinutePrice = _selectedDevice.DeviceType.BirthdayMinutePrice,
                                BillID = Convert.ToInt32(_selectedDevice.Device.BillID),
                                DeviceID = _selectedDevice.Device.ID
                            };

                            break;

                        default:
                            break;
                    }
                    unitOfWork.BillsDevices.Add(newBillDevice);
                    unitOfWork.Complete();
                    Devices = new ObservableCollection<DevicePlayDataModel>(unitOfWork.Devices.GetAvailable());
                    BusyDevices = _devices.Where(w => w.Device.Case == CaseText.Busy).Count();
                    AvailableDevices = _devices.Where(w => w.Device.Case == CaseText.Free).Count();
                    TemporaryDevices = _devices.Where(w => w.Device.Case == CaseText.Paused).Count();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        private RelayCommand _stop;
        public RelayCommand Stop
        {
            get
            {
                return _stop
                    ?? (_stop = new RelayCommand(StopMethod));
            }
        }
        private async void StopMethod()
        {
            try
            {
                BillData.EndDate = DateTime.Now;
                if (SelectedDevice == null)
                    return;
                ClientCheck = new ClientCheckDataModel();

                using (var unitOfWork = new UnitOfWork(new GeneralDBContext()))
                {
                    TelephoneSuggestions = unitOfWork.Clients.GetTelephoneSuggetions();
                    BillDevices = new ObservableCollection<BillDevicesDisplayDataModel>(unitOfWork.BillsDevices.GetBillDevices(Convert.ToInt32(_selectedDevice.Device.BillID)));
                    BillItems = new ObservableCollection<BillItemsDisplayDataModel>(unitOfWork.BillsItems.GetBillItems(Convert.ToInt32(_selectedDevice.Device.BillID)));
                }

                clientCheckDialog.DataContext = this;
                await currentWindow.ShowMetroDialogAsync(clientCheckDialog);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        // Move

        private RelayCommand _moveFrom;
        public RelayCommand MoveFrom
        {
            get
            {
                return _moveFrom
                    ?? (_moveFrom = new RelayCommand(MoveFromMethod));
            }
        }
        private void MoveFromMethod()
        {
            try
            {
                if (SelectedDevice == null)
                    return;
                using (var unitOfWork = new UnitOfWork(new GeneralDBContext()))
                {
                    FreeDevices = new ObservableCollection<DeviceFreeDataModel>(unitOfWork.Devices.GetFree(_selectedDevice.GameType));
                }
                AvailableDevicesVisibility = Visibility.Collapsed;
                FreeDevicesVisibility = Visibility.Visible;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        private RelayCommand _cancelMove;
        public RelayCommand CancelMove
        {
            get
            {
                return _cancelMove
                    ?? (_cancelMove = new RelayCommand(CancelMoveMethod));
            }
        }
        private void CancelMoveMethod()
        {
            try
            {
                FreeDevicesVisibility = Visibility.Collapsed;
                AvailableDevicesVisibility = Visibility.Visible;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        private RelayCommand<DeviceFreeDataModel> _moveTo;
        public RelayCommand<DeviceFreeDataModel> MoveTo
        {
            get
            {
                return _moveTo
                    ?? (_moveTo = new RelayCommand<DeviceFreeDataModel>(ExecuteMoveTo));
            }
        }
        private void ExecuteMoveTo(DeviceFreeDataModel selectedFreeDevice)
        {
            try
            {
                using (var unitOfWork = new UnitOfWork(new GeneralDBContext()))
                {
                    BillDevice selectedBillDevice;

                    if (_selectedDevice.Device.Case == CaseText.Busy)
                    {
                        selectedBillDevice = unitOfWork.BillsDevices.FirstOrDefault(s => s.BillID == _selectedDevice.Device.BillID && s.EndDate == null);
                        selectedBillDevice.EndDate = DateTime.Now;
                        selectedBillDevice.Duration = Convert.ToInt32((Convert.ToDateTime(selectedBillDevice.EndDate) - selectedBillDevice.StartDate).TotalMinutes);
                        unitOfWork.BillsDevices.Edit(selectedBillDevice);
                    }
                    else
                    {
                        selectedBillDevice = unitOfWork.BillsDevices.GetLast((int)_selectedDevice.Device.BillID);
                    }

                    selectedFreeDevice.Device.Case = CaseText.Busy;
                    selectedFreeDevice.Device.BillID = _selectedDevice.Device.BillID;
                    unitOfWork.Devices.Edit(selectedFreeDevice.Device);
                    _selectedDevice.Device.Case = CaseText.Free;
                    _selectedDevice.Device.BillID = null;
                    unitOfWork.Devices.Edit(_selectedDevice.Device);

                    BillDevice newBillDevice = null;
                    switch (selectedBillDevice.GameType)
                    {
                        case GamePlayTypeText.Single:

                            newBillDevice = new BillDevice
                            {
                                StartDate = DateTime.Now,
                                GameType = GamePlayTypeText.Single,
                                MinutePrice = selectedFreeDevice.DeviceType.SingleMinutePrice,
                                BillID = Convert.ToInt32(selectedFreeDevice.Device.BillID),
                                DeviceID = selectedFreeDevice.Device.ID
                            };
                            break;

                        case GamePlayTypeText.Multi:
                            newBillDevice = new BillDevice
                            {
                                StartDate = DateTime.Now,
                                GameType = GamePlayTypeText.Multi,
                                MinutePrice = selectedFreeDevice.DeviceType.MultiMinutePrice,
                                BillID = Convert.ToInt32(selectedFreeDevice.Device.BillID),
                                DeviceID = selectedFreeDevice.Device.ID
                            };
                            break;

                        case GamePlayTypeText.Birthday:
                            newBillDevice = new BillDevice
                            {
                                StartDate = DateTime.Now,
                                GameType = GamePlayTypeText.Birthday,
                                MinutePrice = selectedFreeDevice.DeviceType.BirthdayMinutePrice,
                                BillID = Convert.ToInt32(selectedFreeDevice.Device.BillID),
                                DeviceID = selectedFreeDevice.Device.ID
                            };
                            break;

                        default:
                            break;
                    }
                    unitOfWork.BillsDevices.Add(newBillDevice);
                    unitOfWork.Complete();
                    FreeDevicesVisibility = Visibility.Collapsed;
                    AvailableDevicesVisibility = Visibility.Visible;
                    Devices = new ObservableCollection<DevicePlayDataModel>(unitOfWork.Devices.GetAvailable());
                }

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        // Bill Account

        private RelayCommand<string> _showAccount;
        public RelayCommand<string> ShowAccount
        {
            get
            {
                return _showAccount
                    ?? (_showAccount = new RelayCommand<string>(ShowAccountMethod));
            }
        }
        private void ShowAccountMethod(string billID)
        {
            try
            {
                if (billID == null)
                    return;
                AccountVisibility = Visibility.Collapsed;
                using (var unitOfWork = new UnitOfWork(new GeneralDBContext()))
                {
                    BillDevices = new ObservableCollection<BillDevicesDisplayDataModel>(unitOfWork.BillsDevices.GetBillDevices(Convert.ToInt32(billID)));
                    BillItems = new ObservableCollection<BillItemsDisplayDataModel>(unitOfWork.BillsItems.GetBillItems(Convert.ToInt32(billID)));
                }
                AvailableDevicesVisibility = Visibility.Collapsed;
                AccountVisibility = Visibility.Visible;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        private RelayCommand _cancelAccount;
        public RelayCommand CancelAccount
        {
            get
            {
                return _cancelAccount
                    ?? (_cancelAccount = new RelayCommand(CancelAccountMethod));
            }
        }
        private void CancelAccountMethod()
        {
            try
            {
                AccountVisibility = Visibility.Collapsed;
                AvailableDevicesVisibility = Visibility.Visible;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        // Bill Items

        private RelayCommand _showBillItems;
        public RelayCommand ShowBillItems
        {
            get
            {
                return _showBillItems
                    ?? (_showBillItems = new RelayCommand(ShowBillItemsMethod));
            }
        }
        private void ShowBillItemsMethod()
        {
            try
            {
                if (SelectedDevice == null)
                    return;
                currentWindow.Hide();
                BillItemsViewModel.BillID = (int)SelectedDevice.Device.BillID;
                new BillItemsWindow().ShowDialog();
                currentWindow.ShowDialog();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        // Client

        private RelayCommand _checkClient;
        public RelayCommand CheckClient
        {
            get
            {
                return _checkClient ?? (_checkClient = new RelayCommand(
                    ExecuteCheckClient,
                    CanExecuteCheckClient));
            }
        }
        private async void ExecuteCheckClient()
        {
            try
            {
                if (ClientCheck.Telephone == null)
                    return;
                using (var unitOfWork = new UnitOfWork(new GeneralDBContext()))
                {
                    var client = unitOfWork.Clients.SingleOrDefault(s => s.Telephone == _clientCheck.Telephone);
                    await currentWindow.HideMetroDialogAsync(clientCheckDialog);
                    if (client == null)
                    {
                        NewClient = new ClientBillAddDataModel
                        {
                            Telephone = _clientCheck.Telephone
                        };
                        clientAddDialog.DataContext = this;
                        await currentWindow.ShowMetroDialogAsync(clientAddDialog);
                    }
                    else
                    {
                        BillData.BillID = (int)_selectedDevice.Device.BillID;
                        BillData.ClientID = client.ID;
                        BillData.DeviceID = _selectedDevice.Device.ID;
                        new AccountPaidWindow().ShowDialog();
                        LoadedMethod();
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }
        private bool CanExecuteCheckClient()
        {
            try
            {
                return !ClientCheck.HasErrors;
            }
            catch
            {
                return false;
            }
        }

        private RelayCommand _addClient;
        public RelayCommand AddClient
        {
            get
            {
                return _addClient ?? (_addClient = new RelayCommand(
                    ExecuteAddClientAsync,
                    CanExecuteAddClient));
            }
        }
        private async void ExecuteAddClientAsync()
        {
            try
            {
                if (NewClient.Name == null)
                    return;
                using (var unitOfWork = new UnitOfWork(new GeneralDBContext()))
                {
                    var client = unitOfWork.Clients.Add(new Client
                    {
                        Name = _newClient.Name,
                        Telephone = _newClient.Telephone
                    });
                    unitOfWork.Complete();
                    BillData.DeviceID = _selectedDevice.Device.ID;
                    BillData.ClientID = client.ID;
                    BillData.BillID = (int)_selectedDevice.Device.BillID;
                }
                await currentWindow.HideMetroDialogAsync(clientAddDialog);

                new AccountPaidWindow().ShowDialog();
                LoadedMethod();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }
        private bool CanExecuteAddClient()
        {
            return !NewClient.HasErrors;
        }

        // Items

        private RelayCommand _showAddItems;
        public RelayCommand ShowAddItems
        {
            get
            {
                return _showAddItems
                    ?? (_showAddItems = new RelayCommand(ShowAddItemsMethod));
            }
        }
        private async void ShowAddItemsMethod()
        {
            try
            {
                if (UserData.Role == RoleText.Admin)
                {
                    await currentWindow.ShowMessageAsync("تنبيه", "الكاشير فقط من له الصلاحية فى الدخول", MessageDialogStyle.Affirmative, new MetroDialogSettings()
                    {
                        AffirmativeButtonText = "موافق",
                        DialogMessageFontSize = 25,
                        DialogTitleFontSize = 30
                    });
                    return;
                }
                new ShiftItemsWindow().Show();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        // Spending

        private RelayCommand _showSpending;
        public RelayCommand ShowSpending
        {
            get
            {
                return _showSpending
                    ?? (_showSpending = new RelayCommand(ShowSpendingMethod));
            }
        }
        private async void ShowSpendingMethod()
        {
            try
            {
                if (UserData.Role == RoleText.Admin)
                {
                    await currentWindow.ShowMessageAsync("تنبيه", "الكاشير فقط من له الصلاحية فى الدخول", MessageDialogStyle.Affirmative, new MetroDialogSettings()
                    {
                        AffirmativeButtonText = "موافق",
                        DialogMessageFontSize = 25,
                        DialogTitleFontSize = 30
                    });
                    return;
                }
                new ShiftSpendingWindow().ShowDialog();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        // Finish Shift

        private RelayCommand _showFinishShift;
        public RelayCommand ShowFinishShift
        {
            get
            {
                return _showFinishShift ?? (_showFinishShift = new RelayCommand(
                    ExecuteShowFinishShiftAsync));
            }
        }
        private async void ExecuteShowFinishShiftAsync()
        {
            try
            {
                if (UserData.Role == RoleText.Admin)
                {
                    await currentWindow.ShowMessageAsync("تنبيه", "الكاشير فقط من له الصلاحية فى الدخول", MessageDialogStyle.Affirmative, new MetroDialogSettings()
                    {
                        AffirmativeButtonText = "موافق",
                        DialogMessageFontSize = 25,
                        DialogTitleFontSize = 30
                    });
                    return;
                }
                LoginModel = new LoginDataModel();
                finishShiftConfirmDialog.DataContext = this;
                await currentWindow.ShowMetroDialogAsync(finishShiftConfirmDialog);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        private RelayCommand _signIn;
        public RelayCommand SignIn
        {
            get
            {
                return _signIn ?? (_signIn = new RelayCommand(
                    ExecuteSignInAsync,
                    CanExecuteSignIn));
            }
        }
        private async void ExecuteSignInAsync()
        {
            try
            {
                if (LoginModel.Name == null || LoginModel.Password == null)
                    return;
                if (LoginModel.Name == UserData.Name && LoginModel.Password == UserData.Password)
                {
                    using (var unitOfWork = new UnitOfWork(new GeneralDBContext()))
                    {
                        var shift = unitOfWork.Shifts.FirstOrDefault(s => s.EndDate == null);
                        var safeIncome = unitOfWork.Safes.Find(f => f.UserID == UserData.ID && f.Type == true && f.RegistrationDate >= shift.StartDate && f.RegistrationDate <= DateTime.Now).Sum(s => s.Amount);
                        safeIncome = (safeIncome.HasValue) ? safeIncome : 0;
                        var itemsBillTotal = unitOfWork.BillsItems.Find(f => f.Bill.Type == GeneralText.Items && f.Bill.EndDate == null).Sum(s => s.Total);
                        itemsBillTotal = (itemsBillTotal.HasValue) ? itemsBillTotal : 0;
                        var spending = unitOfWork.Safes.Find(f => f.UserID == UserData.ID && f.Type == false && f.RegistrationDate >= shift.StartDate && f.RegistrationDate <= DateTime.Now).Sum(s => s.Amount);
                        spending = (spending.HasValue) ? spending : 0;

                        Shift = new FinishShiftDataModel
                        {
                            NewShift = true,
                            CurrentUserName = shift.User.Name,
                            SafeStart = shift.SafeStart,
                            StartDate = shift.StartDate,
                            Income = safeIncome + itemsBillTotal,
                            Spending = spending
                        };
                        Shift.Total = shift.SafeStart + Shift.Income - spending;
                    }
                    finishShiftDialog.DataContext = this;
                    await currentWindow.HideMetroDialogAsync(finishShiftConfirmDialog);
                    await currentWindow.ShowMetroDialogAsync(finishShiftDialog);
                }
                else
                {
                    await currentWindow.HideMetroDialogAsync(finishShiftConfirmDialog);
                    await currentWindow.ShowMessageAsync("فشل الدخول", "يوجد خطأ فى الاسم أو الرقم السرى يرجى التأكد من البيانات", MessageDialogStyle.Affirmative, new MetroDialogSettings()
                    {
                        AffirmativeButtonText = "موافق",
                        DialogMessageFontSize = 25,
                        DialogTitleFontSize = 30
                    });
                    await currentWindow.ShowMetroDialogAsync(finishShiftConfirmDialog);
                }

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
            finally
            {
                Mouse.OverrideCursor = null;
            }
        }
        private bool CanExecuteSignIn()
        {
            return !LoginModel.HasErrors;
        }

        private RelayCommand _finishShift;
        public RelayCommand FinishShift
        {
            get
            {
                return _finishShift ?? (_finishShift = new RelayCommand(
                    ExecuteFinishShiftAsync,
                    CanExecuteFinishShift));
            }
        }
        private async void ExecuteFinishShiftAsync()
        {
            try
            {
                if (Shift.SafeEnd == null)
                    return;
                if (Shift.NewShift == true && (Shift.UserName == null || Shift.Password == null))
                    return;
                using (var unitOfWork = new UnitOfWork(new GeneralDBContext()))
                {
                    Mouse.OverrideCursor = Cursors.Wait;
                    string oldUSer = UserData.Name;
                    if (_shift.NewShift)
                    {
                        var user = unitOfWork.Users.SingleOrDefault(s => s.Name == _shift.UserName && s.Password == _shift.Password && s.IsWorked == true);

                        if (user == null)
                        {
                            Mouse.OverrideCursor = null;
                            await currentWindow.ShowMessageAsync("فشل الإنهاء", "يوجد خطأ فى الاسم أو الرقم السرى يرجى التأكد من البيانات", MessageDialogStyle.Affirmative, new MetroDialogSettings()
                            {
                                AffirmativeButtonText = "موافق",
                                DialogMessageFontSize = 25,
                                DialogTitleFontSize = 30
                            });
                            return;
                        }

                        else if (user.Role.Name == RoleText.Admin)
                        {
                            Mouse.OverrideCursor = null;
                            await currentWindow.ShowMessageAsync("فشل الإنهاء", "لا تملك الصلاحية الكاشير فقط من يستطيع بداية شيفت جديد", MessageDialogStyle.Affirmative, new MetroDialogSettings()
                            {
                                AffirmativeButtonText = "موافق",
                                DialogMessageFontSize = 25,
                                DialogTitleFontSize = 30
                            });
                            return;
                        }
                        else
                        {
                            UserData.ID = user.ID;
                            UserData.Role = user.Role.Name;
                            UserData.Name = user.Name;
                            UserData.Password = user.Password;
                        }
                    }
                    else
                    {
                        UserData.Role = "";
                        UserData.Name = "";
                        UserData.Password = "";
                        UserData.ID = 0;
                    }

                    DateTime endDate = DateTime.Now;
                    Bill bill = unitOfWork.Bills.SingleOrDefault(s => s.EndDate == null && s.Type == GeneralText.Items);
                    if (bill != null)
                    {
                        var itemsBillTotal = unitOfWork.BillsItems.Find(f => f.BillID == bill.ID).Sum(s => s.Total);
                        bill.UserID = UserData.ID;
                        bill.ItemsSum = (itemsBillTotal.HasValue) ? itemsBillTotal : 0;
                        bill.Total = bill.ItemsSum;
                        bill.TotalAfterDiscount = bill.ItemsSum;
                        bill.Discount = 0;
                        bill.Ratio = 0;
                        bill.Date = DateTime.Now;
                        bill.EndDate = endDate;
                        unitOfWork.Bills.Edit(bill);

                        if (bill.TotalAfterDiscount > 0)
                        {
                            Safe safe = new Safe
                            {
                                Amount = bill.TotalAfterDiscount,
                                CanDelete = false,
                                Statement = "طلبات خارجية ",
                                UserID = UserData.ID,
                                RegistrationDate = endDate,
                                Type = true
                            };
                            unitOfWork.Safes.Add(safe);
                        }
                        else
                        {
                            unitOfWork.Bills.Remove(bill);
                        }
                    }

                    var shift = unitOfWork.Shifts.SingleOrDefault(s => s.EndDate == null);
                    shift.EndDate = endDate;
                    shift.Income = _shift.Income;
                    shift.SafeEnd = _shift.SafeEnd;
                    shift.Spending = _shift.Spending;
                    shift.Total = _shift.Total;
                    unitOfWork.Shifts.Edit(shift);

                    if (_shift.NewShift)
                    {
                        Shift newShift = new Shift
                        {
                            StartDate = DateTime.Now,
                            UserID = UserData.ID,
                            SafeStart = _shift.SafeEnd
                        };
                        unitOfWork.Shifts.Add(newShift);
                    }
                    unitOfWork.Complete();

                    string path = "";
                    bool exists;
                    try
                    {
                        path = @"D:\JoyDB";
                        exists = Directory.Exists(path);
                        if (!exists)
                            Directory.CreateDirectory(path);
                    }
                    catch
                    {

                    }
                    try
                    {
                        path = @"E:\JoyDB";
                        exists = Directory.Exists(path);
                        if (!exists)
                            Directory.CreateDirectory(path);
                    }
                    catch
                    {
                        path = @"D:\JoyDB";
                    }
                    using (GeneralDBContext db = new GeneralDBContext())
                    {
                        try
                        {
                            string fileName = path + $"\\JoyDB shift {oldUSer} {DateTime.Now.ToShortDateString().Replace('/', '-')} - {DateTime.Now.ToLongTimeString().Replace(':', '-')}";
                            string dbname = db.Database.Connection.Database;
                            string sqlCommand = @"BACKUP DATABASE [{0}] TO  DISK = N'" + fileName + ".bak' WITH NOFORMAT, NOINIT,NAME = N'MyAir-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10";
                            db.Database.ExecuteSqlCommand(TransactionalBehavior.DoNotEnsureTransaction, string.Format(sqlCommand, dbname));
                        }
                        catch
                        {
                        }
                    }
                    Mouse.OverrideCursor = null;
                    await currentWindow.HideMetroDialogAsync(finishShiftDialog);
                    if (!_shift.NewShift)
                    {
                        currentWindow.Close();
                        new MainViewModel().NavigateToViewMethodAsync("SignOut");
                    }
                    else
                    {
                        UserData.newShift = true;
                        currentWindow.Close();
                    }
                }

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
            finally
            {
                Mouse.OverrideCursor = null;
            }
        }
        private bool CanExecuteFinishShift()
        {
            if (Shift.HasErrors)
                return false;
            else if (Shift.NewShift == true && (Shift.UserName == null || Shift.Password == null))
                return false;
            else
                return true;

        }

        // Show Calc 

        private RelayCommand _showCalc;
        public RelayCommand ShowCalc
        {
            get
            {
                return _showCalc ?? (_showCalc = new RelayCommand(
                    ExecuteShowCalc));
            }
        }
        private void ExecuteShowCalc()
        {
            try
            {
                Process.Start("calc.exe");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        private RelayCommand<string> _closeDialog;
        public RelayCommand<string> CloseDialog
        {
            get
            {
                return _closeDialog
                    ?? (_closeDialog = new RelayCommand<string>(ExecuteCloseDialogAsync));
            }
        }
        private async void ExecuteCloseDialogAsync(string parameter)
        {
            try
            {
                switch (parameter)
                {
                    case "ClientCheck":
                        await currentWindow.HideMetroDialogAsync(clientCheckDialog);
                        break;
                    case "AddClient":
                        await currentWindow.HideMetroDialogAsync(clientAddDialog);
                        break;
                    case "FinishShift":
                        await currentWindow.HideMetroDialogAsync(finishShiftDialog);
                        break;
                    case "Login":
                        await currentWindow.HideMetroDialogAsync(finishShiftConfirmDialog);
                        break;
                    default:
                        break;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

    }
}

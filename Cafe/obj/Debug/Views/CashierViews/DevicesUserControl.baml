   M S B A M L   `   `   `  ����  Cafe0    *Cafe.Views.CashierViews.DevicesUserControl   5      R NMahApps.Metro.IconPacks, Version=1.9.1.0, Culture=neutral, PublicKeyToken=null=	iconPacks-http://metro.mahapps.com/winfx/xaml/iconpacks  5      n jSAPBusinessObjects.WPF.ViewerShared, Version=13.0.3500.0, Culture=neutral, PublicKeyToken=692fbea5521e1304R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      c _System.Windows.Interactivity, Version=4.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bi:http://schemas.microsoft.com/expression/2010/interactivity  5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5        >�Language$  ar-EG�5      $��RightToLeft=�.  (System.Windows.Interactivity.Interaction   Triggers 5      /  )System.Windows.Interactivity.EventTrigger  5   
      	EventName$ Loaded��6   .  (System.Windows.Interactivity.TriggerBase   Actions. 5      6  0System.Windows.Interactivity.InvokeCommandAction     Command 6$   �� *Loaded+5       � 	Resources 5       �� MergedDictionaries �� Source�� 5   
    5      �� 5      $ ..\..\Skins\MainSkin.xaml?�6%   %    5      .��5      � $	��0,5q�6    � RowDefinitions 5   
   �� 5      $	��10* �6   �� 5       $	��.5* �6   .+�5#   
   � $��0��6   	 � ColumnDefinitions	 5%      �� 5&      $
��1.3* �6#   �� 5'      $
��.04* �6#   �� 5(      $��7* �6#   .+�5,      � $��0��6    5.      �� 5/      $��5* �6$   �� 50      $
��4.8* �6$   .+�53      �� $��0��6   $��5q�6*   .+�55      �� $
��5,10q�6<      SquareButtonStyle#��[  6J   ��6   �� *	ShowItems+.��56      �� 
 �� Orientation$
 
Horizontal=�6%   .+�57      �� $%��الطلبات الخارجية��6)   $	��5,0q�6A     TextBlockStyle#��[ 6N   6y   .  (MahApps.Metro.IconPacks.PackIconMaterial  58      �  �ControlzEx.PackIconBase`1[[MahApps.Metro.IconPacks.PackIconMaterialKind, MahApps.Metro.IconPacks, Version=1.9.1.0, Culture=neutral, PublicKeyToken=null]]   Kind$ Coffee=�69   59      5:      �� 5<      $
��5,10q�6@   #��[  6O   ��6   �� *ShowSpending+.��5=      �� $
 
Horizontal=�6%   .+�5>      �� $��المصاريف��6)   $	��5,0q�69   #��[ 6F   6q   ,  &MahApps.Metro.IconPacks.PackIconModern  5?      �  �ControlzEx.PackIconBase`1[[MahApps.Metro.IconPacks.PackIconModernKind, MahApps.Metro.IconPacks, Version=1.9.1.0, Culture=neutral, PublicKeyToken=null]]   Kind$ Money=�67   5@      5A      �� 5C      $
��5,10q�6C   #��[  6R   ��6   �� *ShowFinishShift+.��5D      �� $
 
Horizontal=�6%   .+�5E      �� $��إنهاء الشفت��6)   $	��5,0q�6<   #��[ 6I   6t     5F      $ 	TimerStop=�67   5G      5H      �� 5K      $
��5,10q�6<   #��[  6K   ��6   �� *
ShowCalc+.��5L      �� $
 
Horizontal=�6%   .+�5M      �� $��آله حاسبة��6)   $	��5,0q�6:   #��[ 6G   6r   1	  +MahApps.Metro.IconPacks.PackIconFontAwesome	  5N      �
  �ControlzEx.PackIconBase`1[[MahApps.Metro.IconPacks.PackIconFontAwesomeKind, MahApps.Metro.IconPacks, Version=1.9.1.0, Culture=neutral, PublicKeyToken=null]] 
  Kind$ 
Calculator=�6<   5O      5P      5S      �� 5U      $��1��6   .+�5V      �� $��0 30 0 0q�6   $��..\..\Resources\joy.jpg��6.   $
��Fill=�6O   $	��200��6^   �� 5X      
����  �$	��0,5q�62     TextBlockAddUpdateStyle#��[ 6?   $��Veranda)�6p   $��25(�6�   	33297446�   �� 5Z      -   5        $��lblTimer��5Z       #��[ 60   $��Veranda)�6a   $��25(�6v   ��6�   ��  �� Path$ CurrentTime�6�   5[      5\      �� 5^      $��1��6   
���   �#��["�6;   � 5b      $��2��6   .+�5e      �� -   5        $��	listView1��5e      $��0��6L   $��Disabled=�6�    �� SelectionMode$ Single=�6.  y�6Y   �� *AvailableDevicesVisibility+��6�   �� *	Devices+ �� SelectedItem 6�   �� *SelectedDevice+ �� UpdateSourceTrigger$ PropertyChanged=� � ContextMenu 5g      �� 5h       5i        5j   "   $ 
MouseEnter��61   . 5k   &      6<   �� *Check+5l   #   .@�5n      m� $��الطلبات��6(   y�69   �� *StopVisibility+ m� Command 6`   �� *ShowBillItems+ m� Icon 5o   &     5p   *   $ FoodForkDrink=�6E   $��10,0,5,0q�6Z   5r   #   m� 5t   "   $��
تشغيل��6+   y�6:   �� *StartVisibility+.@�5v   &   m� $��فردى��60    m� CommandParameter$ Single��6Z    6@   �� *Start+ 5w   *     5x   .   $ AccountMultiple=�6I   $��10,0,5,0q�6`   5z   '   m� 5{   &   $��
مالتى��60   $ Multi��6[    6A   �� *Start+ 5|   *     5}   .   $ PeopleMultiple=�6G   $��10,0,5,0q�6]   5   '   m� 5�   &   $��عيد ميلاد��60   $ Birthday��6�   y�6C   �� *BirthdayVisibility+ 6n   �� *Start+ 5�   *   	  5�   .   $ BirthdayCake=�6L   $��10,0,5,0q�6`   5�   '    5�   &   	  5�   *   $ 
PlayCircle=�6H   $��10,0,5,0q�6Z   5�   #   m� 5�   "   $��تغير النوع��6+   y�6?   �� *StopVisibility+.@�5�   &   m� $��فردى��60   $ Single��6[    6@   �� *Change+y�6u   �� *SingleVisibility+ 5�   *     5�   .   $ AccountMultiple=�6I   $��10,0,5,0q�6`   5�   '   m� 5�   &   $��
مالتى��60   $ Multi��6�   y�6?   �� *MultiVisibility+ 6g   �� *Change+ 5�   *     5�   .   $ PeopleMultiple=�6G   $��10,0,5,0q�6]   5�   '   m� 5�   &   $��عيد ميلاد��60   $ Birthday��6�   y�6C   �� *BirthdayVisibility+ 6n   �� *Change+ 5�   *   	  5�   .   $ BirthdayCake=�6L   $��10,0,5,0q�6`   5�   '    5�   &   	  5�   *   $ Exchange=�6H   $��10,0,5,0q�6X   5�   #   m� 5�   "   $��إيقاف مؤقت��6,    6B   �� *TemporaryStop+y�6e   �� *TemporaryVisibility+ 5�   &     5�   *   $ SignStop=�6C   $��10,0,5,0q�6T   5�   #   m� 5�   "   $#��إستئناف التشغيل��6,    6G   �� *Resume+y�6c   �� *ResumeVisibility+ 5�   &     5�   *   $ ControlResume=�6C   $��10,0,5,0q�6Y   5�   #   m� 5�   "   $��نقل��6,    6;   �� *
MoveFrom+y�6Y   �� *StopVisibility+ 5�   &     5�   *   $ 
FolderMove=�6E   $��10,0,5,0q�6X   5�   #   m� 5�      $$��طباعة آخر فاتورة��6'   y�6B   �� *PrintVisibility+ 6k   �� *Print+ 5�   "     5�   &   $ Printer=�6B   $��10,0,5,0q�6R   5�      m� 5�      $&�� إنهاء ودفع الحساب��6'   y�6C   �� *StopVisibility+ 6k   �� *Stop+ 5�   "     5�   &   $ StopCircleOutline=�6A   $��10,0,5,0q�6Z   5�      m� 5�      $��
إلغاء��6'   y�67   �� *CancelVisibility+ 6a   �� *
ShowCancel+ 5�   "     5�   &   $ Cancel=�6?   $��10,0,5,0q�6N   5�      5�      ��5�      �� 5�      .R�5�      �  K� IsItemsHost . 6(   5�      ��5�      �� 5�      .R�5�      �� $��5q�6)   .+�5�   "   �� 
������ ��6B   �� *DataContext.ShowAccount+ �� RelativeSource ��  �� AncestorType" >���5�   ]   �� *Device.BillID+.��5�   &   �� $	��200��6O   $	��100��6[   $
��Fill=�6h   ��6,   �� *DeviceTypeImage+6h   5�   #   �� 5�   "   #��[ 6,   ��6]   �� *Device.Name+6|   5�      5�      5�      � 5�      y�6   �� *AccountVisibility+	 5�      �� 5�      $��6* �6+   �� 5�      $��4* �6+    5�      �� 5�      $��1* �6(   �� 5�      $��9* �6(   .+�5�      �� $��2��6!   $
 
Horizontal=�65   $��Center=�6N   $	��0,8q�6l   .+�5�      ��  �� IsCancel . #��[  6S   $	��150��6~   $��Center=�6�   $
��10,5q�6�   ��61   �� *CancelAccount+.��5�      �� $
 
Horizontal=�6)   .+�5�   "   �� $��رجوع��6-   #��[ 6:   $
��10,0q�6b   6r   ,  &MahApps.Metro.IconPacks.PackIconEntypo  5�   "   �  �ControlzEx.PackIconBase`1[[MahApps.Metro.IconPacks.PackIconEntypoKind, MahApps.Metro.IconPacks, Version=1.9.1.0, Culture=neutral, PublicKeyToken=null]]   Kind$
 Back=�6;   5�      5�      5�      &   System.Windows.Controls.DataGrid  5�      $��	10,0,10,0q�5�      $��0��5�      $��1��5�         HeadersVisibility$	 All=�5�         SelectionUnit$ FullRow=�5�       J� IsManipulationEnabled .     CanUserDeleteRows .     CanUserAddRows .      AutoGenerateColumns  .  ��5�      �� *BillDevices+ 5�      �� *SelectedBillDevice+!   Columns! 5     0  *System.Windows.Controls.DataGridTextColumn  5     ,  &System.Windows.Controls.DataGridColumn"   
IsReadOnly" . #   Header$# 
النوع��6D   $   Width5  /System.Windows.Controls.DataGridLengthConverter$
$ 1.5* 6S     ColumnHeaderStyle3%   HeaderStyle#% [ 6`   1  +System.Windows.Controls.DataGridBoundColumn&   Binding& 5  %   �� *DeviceType.Name+  5     " . $# الجهاز��6D   $
$ 1.2* 6T   #% [ 6a   & 5	  %   �� *Device.Name+  5
     " . $# 
اللعب��6D   $$ 1* 6S   #% [ 6^   & 5  %   �� *BillDevice.GameType+  5     " . $# البداية��6D   $$ 1* 6U   #% [ 6`   & 5  %   �� *BillDevice.StartDate+' �� StringFormat$' {0:hh:mm tt }��  5     " . $# النهاية��6D   $$ 1* 6U   #% [ 6`   & 5  %   �� *	EndDate+$' {0:hh:mm tt }��  5     " . $# 
المدة��6D   $$ 1* 6S   #% [ 6^   & 5  %   �� *
Duration+  5     " . $# الإجمالى��6D   $
$ 1.2* 6V   #% [ 6c   & 5  %   �� *Total+$' {0:0.00;(0.00)}��5       5     $��	10,0,10,0q�6!   $��1��64   $��1��6D   $	 All=�5     $ FullRow=�5      .   .   .    .  ��5     �� *	BillItems+ 5     �� *SelectedBillItem+! 5%       5&     " . $# 
الصنف��6D   $$ 2* 6S     ColumnHeaderStyle4#% [ 6^   & 5'  %   �� *	Item.Name+  5(     " . $# 
السعر��6D   $$ 1* 6S   #% [ 6^   & 5)  %   �� *BillItem.Price+  5*     " . $# الكمية��6D   $$ 1* 6T   #% [ 6_   & 5+  %   �� *BillItem.Qty+  5,     " . $# الإجمالى��6D   $$ 1* 6V   #% [ 6a   & 5-  %   �� *BillItem.Total+$' {0:0.00;(0.00)}����51     �� 52       MetroDataGrid( �� BasedOn#( [ 6$   ) �� 
TargetType")  53     .�54  "   �� * �� Property * �@ AlternatingRowBackground  GrayBrush10+ �� Value#+ �  55     56     59     5;     � 5A     $��1��6   y�6'   �� *FreeDevicesVisibility+ 5C     �� 5D     $��1* �6(   �� 5E     $��9* �6(   .+�5H     �� $
 
Horizontal=�6!   $��Center=�6:   $	��0,8q�6X   .+�5I     ��  . #��[  6P   $	��150��6{   $��Center=�6�   $
��10,5q�6�   ��61   �� *
CancelMove+.��5J     �� $
 
Horizontal=�6)   .+�5K  "   �� $��إلغاء النقل��6-   #��[ 6A   $
��10,0q�6i   6y     5L  "   $ Cancel=�6;   5M     5N     5O     �� 5Q     -   5        $��	listView2��5Q     $��1��6Q   $��Disabled=�6�   ��6^   �� *FreeDevices+��5S     �� 5T     .R�5U  "   �  . 6,   5V     ��5Y     �� 5[     .R�5]  "   �� $��10q�6-   .+�5_  &   �� 
������ ��6F   �� *DataContext.MoveTo+ �� $ ListBoxL���5`  A   �� .��5a  *   �� $	��200��6S   $	��100��6_   ��60   �� *DeviceTypeImage+6_   5b  '   �� 5c  &   #��[ 60   ��6a   �� *Device.Name+6�   5e  #   5f     5h     5j     5o     5r     �� 5v  
   $��Bottom=�6F   $��1��6a   y�6   �� *AvailableDevicesVisibility+.@�5w     �� $%��الأجهزة المشغولة��6     StatusBarItemStyle#��[ 67   �� 5x       MetroStatusBarSeparator#��[ 6   6K   �� 5y     #��[ 6=   ��6   �� *BusyDevices+6=   �� 5z     #��[ 6   6K   �� 5{     $2��,الأجهزة الموقوفة مؤقتاً��6   #��[ 6>   �� 5|     #��[ 6   6K   �� 5}     #��[ 6B   ��6   �� *TemporaryDevices+6B   �� 5~     #��[ 6   6K   �� 5     $#��الأجهزة المتاحة��6   #��[ 66   �� 5�     #��[ 6   6K   �� 5�     #��[ 6B   ��6   �� *AvailableDevices+6B   5�     �� 5�  
   $��Bottom=�6A   $��1��6\   y�6   �� *FreeDevicesVisibility+.@�5�     �� $#��الأجهزة المتاحة��6   #��[ 66   �� 5�     #��[ 6   6K   �� 5�     #��[ 6C   ��6   �� *FreeDevices.Count+6C   5�     �� 5�  
   $��Bottom=�6=   $��1��6X   y�6   �� *AccountVisibility+.@�5�     �� $$��  إجمالى الأجهزة:��6   #��[ 68   �� 5�     #��[ 6   6K   �� 5�     #��[ 6U   ��6   �� *
DevicesSum+$' 	{0:0;(0)}��6U   �� 5�     $�� جنيهاً ��6   #��[ 6/   �� 5�     #��[ 6   6K   �� 5�     $#�� إجمالى الطلبات:��6   #��[ 67   �� 5�     #��[ 6   6K   �� 5�     #��[ 6S   ��6   �� *
ItemsSum+$' 	{0:0;(0)}��6S   �� 5�     $�� جنيهاً ��6   #��[ 6/   �� 5�     #��[ 6   6K   �� 5�     $�� الإجمالى:��6   #��[ 61   �� 5�     #��[ 6   6K   �� 5�     #��[ 6S   ��6   �� *
TotalSum+$' 	{0:0;(0)}��6S   �� 5�     $�� جنيهاً ��6   #��[ 6/   5�     5�     5�     
   M S B A M L   `   `   `  ����?  ;Cafe, Version=0.0.0.1, Culture=neutral, PublicKeyToken=null+clr-namespace:Cafe.HelpersCafe.Helpers  5      U QMahApps.Metro, Version=1.5.0.23, Culture=neutral, PublicKeyToken=f4fb5a3c4d1e5b4fV;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.MetroMahApps.Metro.Controls 5      Q MWPFTextBoxAutoComplete, Version=1.0.0.2, Culture=neutral, PublicKeyToken=null_Dclr-namespace:WPFTextBoxAutoComplete;assembly=WPFTextBoxAutoCompleteWPFTextBoxAutoComplete 5      fCclr-namespace:MahApps.Metro.Controls.Dialogs;assembly=MahApps.MetroMahApps.Metro.Controls.Dialogs 5      @    :Cafe.Views.CashierViews.FinishShiftViews.FinishShiftDialog   5      &Helpersclr-namespace:Cafe.Helpers  5      HControls;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.Metro  5      n jSAPBusinessObjects.WPF.ViewerShared, Version=13.0.3500.0, Culture=neutral, PublicKeyToken=692fbea5521e1304R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      Z	behaviorsDclr-namespace:WPFTextBoxAutoComplete;assembly=WPFTextBoxAutoComplete     5      WdialogsCclr-namespace:MahApps.Metro.Controls.Dialogs;assembly=MahApps.Metro     5      R NMahApps.Metro.IconPacks, Version=1.9.1.0, Culture=neutral, PublicKeyToken=null=	iconPacks-http://metro.mahapps.com/winfx/xaml/iconpacks  5
      Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006  5      1  +MahApps.Metro.Controls.Dialogs.CustomDialog   Language$  ar-EG�5      4  .MahApps.Metro.Controls.Dialogs.BaseMetroDialog   Title$ نهاية الشفت��5      $��RightToLeft=�5      8  2MahApps.Metro.Controls.Dialogs.DialogParticipation   Register 5      �� .��5      �� -   5        $	��pnl��5      $��10q�6    � 	Resources 5   
      BoolToVisibility �� MergedDictionaries �� Source�� 5       5      �� 5      $" ..\..\..\Skins\MainSkin.xaml?�6)   %   &	        �� 5      6/   5      .+�5   
   ��  �� Orientation$ 
Horizontal=�6   .+�5      ��   TextBlockStyle#��[ 6   $��5q�6@   الكاشير :6W   �� 5      #��[ 6?   $��5q�6g   ��6   �� *Shift.CurrentUserName+6g   5!      �� 5$   
   $ 
Horizontal=�6   .+�5&      �� #��[ 6   $��5q�6@    وقت بداية الشفت :6^   �� 5(      #��[ 6e   $��5q�6�   ��6   �� *Shift.StartDate+ �� StringFormat$ {0:hh:mm tt yyyy/MM/dd  }��6�   5*      �� 5,   
   $ 
Horizontal=�6   .+�5.      �� #��[ 6   $��5q�6@   بداية الشفت :6Z   �� 50      #��[ 6R   $��5q�6z   ��6   �� *Shift.SafeStart+$ 	{0:0;(0)}��6z   �� 52      #��[ 6   $��5q�6@   جنيهاً6S   54      �� 56   
   $ 
Horizontal=�6   .+�58      �� #��[ 6   $��5q�6@   %#إجمالى الحد الادنى:6`   �� 5:      #��[ 6U   $��5q�6}   ��6   �� *Shift.TotalMinimum+$ 	{0:0;(0)}��6}   �� 5<      #��[ 6   $��5q�6@   جنيهاً6S   5>      �� 5@   
   $ 
Horizontal=�6   .+�5B      �� #��[ 6   $��5q�6@   إجمالى الأجهزة:6]   �� 5D      #��[ 6U   $��5q�6}   ��6   �� *Shift.TotalDevices+$ 	{0:0;(0)}��6}   �� 5F      #��[ 6   $��5q�6@   جنيهاً6S   5H      �� 5J   
   $ 
Horizontal=�6   .+�5L      �� #��[ 6   $��5q�6@   إجمالى الطلبات :6]   �� 5N      #��[ 6S   $��5q�6{   ��6   �� *Shift.TotalItems+$ 	{0:0;(0)}��6{   �� 5P      #��[ 6   $��5q�6@   جنيهاً6S   5R      �� 5T   
   $ 
Horizontal=�6   .+�5V      �� #��[ 6   $��5q�6@   !إجمالى الخصومات :6^   �� 5X      #��[ 6V   $��5q�6~   ��6   �� *Shift.TotalDiscount+$ 	{0:0;(0)}��6~   �� 5Z      #��[ 6   $��5q�6@   جنيهاً6S   5\      �� 5_   
   $ 
Horizontal=�6   .+�5a      �� #��[ 6   $��5q�6@   الدخل :6T   �� 5c      #��[ 6O   $��5q�6w   ��6   �� *Shift.Income+$ 	{0:0;(0)}��6w   �� 5d      #��[ 6   $��5q�6A   جنيهاً6T   5e      �� 5g   
   $ 
Horizontal=�6   .+�5i      �� #��[ 6   $��5q�6@   المصاريف :6X   �� 5k      #��[ 6Q   $��5q�6y   ��6   �� *Shift.Spending+$ 	{0:0;(0)}��6y   �� 5l      #��[ 6   $��5q�6@   جنيهاً6S   5m      �� 5o   
   $ 
Horizontal=�6   .+�5q      �� #��[ 6   $��5q�6@   الإجمالى :6X   �� 5s      #��[ 6N   $��5q�6v   ��6   �� *Shift.Total+$ 	{0:0;(0)}��6v   �� 5t      #��[ 6   $��5q�6@   جنيهاً6S   5u      �� 5w   
   #��[ 6   $��5q�6<   
الدرج6N   *  $MahApps.Metro.Controls.NumericUpDown  5y   
   -   5        $��First��5y   Y     NumericUpDownStyle#��[ 6�      Minimum$ 0Q�6�   !   Cafe.Helpers.FocusExtension	   	IsFocused	 6!   �� *	IsFocused+
   Value
 6f   �� *Shift.SafeEnd+" �� ValidatesOnNotifyDataErrors .  �� UpdateSourceTrigger$ PropertyChanged=�5z      )  #MahApps.Metro.Controls.ToggleSwitch  5|   
   -   5          Name$ VisibilityToggle��5|       $��Center=�6;      OnLabel$" بداية شيفت جديد��6X      OffLabel$ انهاء الشيفت��6r     ToggleSwitchStyle#��[ 6�      	IsChecked 6�   �� *Shift.NewShift+ . $ PropertyChanged=�6"  �� 5~   
   y�6   �� *	IsChecked+ �� ElementName$ VisibilityToggle�� �� 	Converter# [  .+�5   
   �� #��[ 6   $	��0,5q�6<   اسم المستخدم6W   �� 5�   
     TextBoxStyle#��[ 6�   ��6   �� *Shift.UserName+ . $ PropertyChanged=�1  +WPFTextBoxAutoComplete.AutoCompleteBehavior   AutoCompleteItemsSource 6y   �� *NamesSuggestions+.��6�   5�      �� 5�   
   #��[ 6   $	��0,5q�6<   الرقم السرى6V   G� 5�      $	��0,5q�6   $��25��6'   *  $MahApps.Metro.Controls.TextBoxHelper   UseFloatingWatermark .   Win8MetroPasswordBox#��[ 5�   5   	   Cafe.Helpers.Secure 	  Password 5�   3   �� *Shift.Password+ . $ PropertyChanged=�5�      5�      �� 5�   
   $��0 10 0 0q�6   �� 5�   
   $ 
Horizontal=�6   $��0 10 0 0q�6.   .+�5�      �� -   5        $	��btn��5�   &    �� 	IsDefault .   SquareButtonStyle#��[ 6Q   $	��120��6|   $	��5,0q�6�   ��61   �� *FinishShift+.��5�      �� $ 
Horizontal=�6   .+�5�      �� $��إنهاء الشفت��6!   #��[ 65   $
��10,0q�6]   6m   ,
  &MahApps.Metro.IconPacks.PackIconModern
  5�      �  �ControlzEx.PackIconBase`1[[MahApps.Metro.IconPacks.PackIconModernKind, MahApps.Metro.IconPacks, Version=1.9.1.0, Culture=neutral, PublicKeyToken=null]]   Kind$ 	TimerStop=�6/   5�      5�      �� 5�       �� IsCancel . $��FinishShift��6E   #��[ 6d   $	��120��6�   $	��5,0q�6�   ��6%   �� *CloseDialog+.��5�      �� $ 
Horizontal=�6   .+�5�      �� $��
إغلاق��6!   #��[ 6/   $
��10,0q�6W   6g   
  5�      $ Cancel=�6/   5�      5�      5�      5�      5�      
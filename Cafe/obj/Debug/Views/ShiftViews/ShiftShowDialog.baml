   M S B A M L   `   `   `  ����U  QMahApps.Metro, Version=1.5.0.23, Culture=neutral, PublicKeyToken=f4fb5a3c4d1e5b4ffCclr-namespace:MahApps.Metro.Controls.Dialogs;assembly=MahApps.MetroMahApps.Metro.Controls.Dialogs  5       Cafe+   %Cafe.Views.ShiftViews.ShiftShowDialog   5      n jSAPBusinessObjects.WPF.ViewerShared, Version=13.0.3500.0, Culture=neutral, PublicKeyToken=692fbea5521e1304R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      WdialogsCclr-namespace:MahApps.Metro.Controls.Dialogs;assembly=MahApps.Metro     5      R NMahApps.Metro.IconPacks, Version=1.9.1.0, Culture=neutral, PublicKeyToken=null=	iconPacks-http://metro.mahapps.com/winfx/xaml/iconpacks  5      Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006  5	      1   +MahApps.Metro.Controls.Dialogs.CustomDialog   Language$  ar-EG�5      4   .MahApps.Metro.Controls.Dialogs.BaseMetroDialog   Title$ 
الشفت��5      $��RightToLeft=�5      8   2MahApps.Metro.Controls.Dialogs.DialogParticipation   Register 5
      �� .��5      �� -   5        $	��pnl��5      $��10q�6    � 	Resources 5   
    �� MergedDictionaries �� Source�� 5       5      �� 5      $ ..\..\Skins\MainSkin.xaml?�6)   %    5      .+�5   
   ��  �� Orientation$ 
Horizontal=�6   .+�5      ��    TextBlockStyle#��[  6   $��5q�6@   الكاشير :6W   �� 5      #��[  6A   $��5q�6i   ��6   �� *SelectedShift.User.Name+6i   5      �� 5   
   $ 
Horizontal=�6   .+�5      �� #��[  6   $��5q�6@    وقت بداية الشفت :6^   �� 5      #��[  6s   $��5q�6�   ��6   �� *SelectedShift.Shift.StartDate+ �� StringFormat$ {0:hh:mm tt yyyy/MM/dd  }��6�   5       �� 5"   
   $ 
Horizontal=�6   .+�5#      �� #��[  6   $��5q�6@    وقت نهاية الشفت :6^   �� 5$      #��[  6q   $��5q�6�   ��6   �� *SelectedShift.Shift.EndDate+$ {0:hh:mm tt yyyy/MM/dd  }��6�   5%      �� 5'   
   $ 
Horizontal=�6   .+�5(      �� #��[  6   $��5q�6@   بداية الشفت :6Z   �� 5)      #��[  6`   $��5q�6�   ��6   �� *SelectedShift.Shift.SafeStart+$ 	{0:0;(0)}��6�   �� 5*      #��[  6   $��5q�6@   جنيهاً6S   5+      �� 5-   
   $ 
Horizontal=�6   .+�5.      �� #��[  6   $��5q�6@   %#إجمالى الحد الادنى:6`   �� 5/      #��[  6c   $��5q�6�   ��6   �� *" SelectedShift.Shift.TotalMinimum+$ 	{0:0;(0)}��6�   �� 50      #��[  6   $��5q�6@   جنيهاً6S   52      �� 54   
   $ 
Horizontal=�6   .+�55      �� #��[  6   $��5q�6@   إجمالى الأجهزة:6\   �� 56      #��[  6c   $��5q�6�   ��6   �� *" SelectedShift.Shift.TotalDevices+$ 	{0:0;(0)}��6�   �� 57      #��[  6   $��5q�6@   جنيهاً6S   58      �� 5:   
   $ 
Horizontal=�6   .+�5;      �� #��[  6   $��5q�6@   إجمالى الطلبات :6]   �� 5<      #��[  6a   $��5q�6�   ��6   �� * SelectedShift.Shift.TotalItems+$ 	{0:0;(0)}��6�   �� 5=      #��[  6   $��5q�6@   جنيهاً6S   5>      �� 5@   
   $ 
Horizontal=�6   .+�5A      �� #��[  6   $��5q�6@   !إجمالى الخصومات :6^   �� 5B      #��[  6d   $��5q�6�   ��6   �� *#!SelectedShift.Shift.TotalDiscount+$ 	{0:0;(0)}��6�   �� 5C      #��[  6   $��5q�6@   جنيهاً6S   5D      �� 5F   
   $ 
Horizontal=�6   .+�5G      �� #��[  6   $��5q�6@   
الدخل6R   �� 5H      #��[  6]   $��5q�6�   ��6   �� *SelectedShift.Shift.Income+$ 	{0:0;(0)}��6�   �� 5I      #��[  6   $��5q�6@   جنيهاً6S   5J      �� 5L   
   $ 
Horizontal=�6   .+�5M      �� #��[  6   $��5q�6@   المصاريف :6X   �� 5N      #��[  6_   $��5q�6�   ��6   �� *SelectedShift.Shift.Spending+$ 	{0:0;(0)}��6�   �� 5O      #��[  6   $��5q�6@   جنيهاً6S   5P      �� 5R   
   $ 
Horizontal=�6   .+�5S      �� #��[  6   $��5q�6@   الإجمالى :6X   �� 5T      #��[  6\   $��5q�6�   ��6   �� *SelectedShift.Shift.Total+$ 	{0:0;(0)}��6�   �� 5U      #��[  6   $��5q�6@   جنيهاً6S   5V      �� 5X   
   $ 
Horizontal=�6   .+�5Y      �� #��[  6   $��5q�6@   الدرج :6T   �� 5Z      #��[  6^   $��5q�6�   ��6   �� *SelectedShift.Shift.SafeEnd+$ 	{0:0;(0)}��6�   �� 5[      #��[  6   $��5q�6@   جنيهاً6S   �� 5\      
���  ��#��[  6C   $
��20,0q�6k   ��6*   �� *	Message+6k   5]      �� 5`   
   $��0 10 0 0q�6   �� 5a   
   $ 
Horizontal=�6   $��0 10 0 0q�6.   .+�5c      ��  �� IsCancel . $
��show��6E     SquareButtonStyle#��[ 6]   $	��120��6�   $	��5,0q�6�   ��6%   �� *CloseDialog+.��5d      �� $ 
Horizontal=�6   .+�5e      �� $��
إغلاق��6!   #��[  6/   $
��10,0q�6W   6g   ,  &MahApps.Metro.IconPacks.PackIconModern  5f      �  �ControlzEx.PackIconBase`1[[MahApps.Metro.IconPacks.PackIconModernKind, MahApps.Metro.IconPacks, Version=1.9.1.0, Culture=neutral, PublicKeyToken=null]]	   Kind$	 Cancel=�6/   5g      5h      5i      5j      5l      
   M S B A M L   `   `   `  ����U  QMahApps.Metro, Version=1.5.0.23, Culture=neutral, PublicKeyToken=f4fb5a3c4d1e5b4ffCclr-namespace:MahApps.Metro.Controls.Dialogs;assembly=MahApps.MetroMahApps.Metro.Controls.Dialogs  5       Cafe.   (Cafe.Views.ShiftViews.ShiftsReportDialog   5      n jSAPBusinessObjects.WPF.ViewerShared, Version=13.0.3500.0, Culture=neutral, PublicKeyToken=692fbea5521e1304R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      WdialogsCclr-namespace:MahApps.Metro.Controls.Dialogs;assembly=MahApps.Metro     5      R NMahApps.Metro.IconPacks, Version=1.9.1.0, Culture=neutral, PublicKeyToken=null=	iconPacks-http://metro.mahapps.com/winfx/xaml/iconpacks  5      Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006  5      1   +MahApps.Metro.Controls.Dialogs.CustomDialog   Language$  ar-EG�5      4   .MahApps.Metro.Controls.Dialogs.BaseMetroDialog   Title$# تقارير الشيفتات��5      $��RightToLeft=�5      8   2MahApps.Metro.Controls.Dialogs.DialogParticipation   Register 5	      �� .��5      �� -   5        $	��pnl��5      $��10q�6    � 	Resources 5   
    �� MergedDictionaries �� Source�� 5       5      �� 5      $ ..\..\Skins\MainSkin.xaml?�6)   %    5      .+�5   
   ��  �� Orientation$ 
Horizontal=�6   .+�5      ��    TextBlockStyle#��[  6   $��5q�6@   من :6Q   �� 5      #��[  6^   $��5q�6�   ��6   �� *
DateFrom+ �� StringFormat$ {0:hh:mm tt yyyy/MM/dd  }��6�   5      �� 5   
   $ 
Horizontal=�6   .+�5      �� #��[  6   $��5q�6@   
إلى :6R   �� 5      #��[  6\   $��5q�6�   ��6   �� *DateTo+$ {0:hh:mm tt yyyy/MM/dd  }��6�   5       �� 5$   
   $ 
Horizontal=�6   .+�5%      �� #��[  6   $��5q�6@   %#إجمالى الحد الادنى:6`   �� 5&      #��[  6\   $��5q�6�   ��6   �� *ShiftsReport.TotalMinimum+$ 	{0:0;(0)}��6�   �� 5'      #��[  6   $��5q�6@   جنيهاً6S   5)      �� 5+   
   $ 
Horizontal=�6   .+�5,      �� #��[  6   $��5q�6@   إجمالى الأجهزة:6\   �� 5-      #��[  6\   $��5q�6�   ��6   �� *ShiftsReport.TotalDevices+$ 	{0:0;(0)}��6�   �� 5.      #��[  6   $��5q�6@   جنيهاً6S   5/      �� 51   
   $ 
Horizontal=�6   .+�52      �� #��[  6   $��5q�6@   إجمالى الطلبات :6]   �� 53      #��[  6Z   $��5q�6�   ��6   �� *ShiftsReport.TotalItems+$ 	{0:0;(0)}��6�   �� 54      #��[  6   $��5q�6@   جنيهاً6S   55      �� 57   
   $ 
Horizontal=�6   .+�58      �� #��[  6   $��5q�6@   !إجمالى الخصومات :6^   �� 59      #��[  6]   $��5q�6�   ��6   �� *ShiftsReport.TotalDiscount+$ 	{0:0;(0)}��6�   �� 5:      #��[  6   $��5q�6@   جنيهاً6S   5;      �� 5>   
   $ 
Horizontal=�6   .+�5?      �� #��[  6   $��5q�6@   !إجمالى المصاريف :6^   �� 5@      #��[  6]   $��5q�6�   ��6   �� *ShiftsReport.TotalSpending+$ 	{0:0;(0)}��6�   �� 5A      #��[  6   $��5q�6@   جنيهاً6S   5B      �� 5D   
   $ 
Horizontal=�6   .+�5E      �� #��[  6   $��5q�5F      إجمالى الدخل :63   �� 5G      #��[  5H      $��5q�5I      ��5G      �� *ShiftsReport.TotalIncome+$ 	{0:0;(0)}��5I      �� 5J      #��[  6   $��5q�5K      جنيهاً6+   5L      �� 5N   
   $ 
Horizontal=�6   .+�5O      �� #��[  6   $��5q�5P      إجمالى الصافى :64   �� 5Q      #��[  5R      $��5q�5S      ��5Q      �� *ShiftsReport.TotalNet+$ 	{0:0;(0)}��5S      �� 5T      #��[  6   $��5q�5U      جنيهاً6+   5V      �� 5X   
   $��0 10 0 0q�6   �� 5Y   
   $ 
Horizontal=�6   $��0 10 0 0q�6.   .+�5[      ��  �� IsCancel . $��report��6E     SquareButtonStyle#��[ 6_   $	��120��6�   $	��5,0q�6�   ��6%   �� *CloseDialog+.��5\      �� $ 
Horizontal=�6   .+�5]      �� $��
إغلاق��6!   #��[  6/   $
��10,0q�6W   6g   ,  &MahApps.Metro.IconPacks.PackIconModern  5^      �  �ControlzEx.PackIconBase`1[[MahApps.Metro.IconPacks.PackIconModernKind, MahApps.Metro.IconPacks, Version=1.9.1.0, Culture=neutral, PublicKeyToken=null]]	   Kind$	 Cancel=�6/   5_      5`      5a      5b      5d      
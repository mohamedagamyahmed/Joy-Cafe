   M S B A M L   `   `   `  ����U  QMahApps.Metro, Version=1.5.0.23, Culture=neutral, PublicKeyToken=f4fb5a3c4d1e5b4fV;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.MetroMahApps.Metro.Controls  5       Cafe4   .Cafe.Views.DeviceViews.DeviceReportUserControl   5      HControls;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.Metro  5      R NMahApps.Metro.IconPacks, Version=1.9.1.0, Culture=neutral, PublicKeyToken=null=	iconPacks-http://metro.mahapps.com/winfx/xaml/iconpacks  5      n jSAPBusinessObjects.WPF.ViewerShared, Version=13.0.3500.0, Culture=neutral, PublicKeyToken=692fbea5521e1304R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      c _System.Windows.Interactivity, Version=4.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bi:http://schemas.microsoft.com/expression/2010/interactivity  5      b ^GalaSoft.MvvmLight.Platform, Version=5.4.1.0, Culture=neutral, PublicKeyToken=5f873c45e98af8a1-Custom http://www.galasoft.ch/mvvmlight  5      R	 NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml    	 5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006    	 5	      @d2http://schemas.microsoft.com/expression/blend/2008    	 5
        >�Language$  ar-EG�5      $��RightToLeft=�.  (System.Windows.Interactivity.Interaction   Triggers 5      /  )System.Windows.Interactivity.EventTrigger  5   
      	EventName$ Loaded��6   .  (System.Windows.Interactivity.TriggerBase   Actions. 5      6  0System.Windows.Interactivity.InvokeCommandAction     Command 6$   �� *Loaded+5       � 	Resources 5       �� MergedDictionaries �� Source�� 5   
    5      �� 5      $ ..\..\Skins\MainSkin.xaml?�6%   %    5      .��5"      � $��1��6    � RowDefinitions 5#   
   �� 5$      $
��1.5* �6   �� 5%      $��7* �6   �� 5&      $��2* �6   �� 5'      $��1* �6   .+�5)   
   � $
��0,10q�6   	 � ColumnDefinitions	 5*      �� 5+      $
��1.5* �6#   �� 5,      $
��1.5* �6#   .+�5/      �� $
��10,0q�6   
 �� SelectedValuePath$
 ID��52       �� DisplayMemberPath$
 Name��53       �� 
IsEditable .    ComboBoxStyle#��[  55      ��50      �� *	Devices+ �� SelectedItem 51      �� *SelectedDevice+ 56        57      $ SelectionChanged��6%   . 58      /  )GalaSoft.MvvmLight.Command.EventToCommand     Command 60   �� *Search+59      5;      �� 5=       �� Orientation$ 
Horizontal=�6   $��1��5>      .+�5?      �� $	��5,0q�6     TextBlockAddUpdateStyle#��[ 5@      من6R   +   %MahApps.Metro.Controls.DateTimePicker  5B        DatePickerStyle#��[ 6*   $	��5,0q�5D   *      SelectedDate 5C   *   �� *
DateFrom+ �� UpdateSourceTrigger$ PropertyChanged=� 5E        5F      $ SelectedDateChanged��6)   . 5G         64   �� *Search+5H      5J      �� 5L        TextBlockStyle#��[ 6   $��Center=�5M      $	��5,0q�5N      إلى6.     5O      #��[ 6*   $	��5,0q�5Q   *    5P   *   �� *DateTo+$ PropertyChanged=� 5R        5S      $ SelectedDateChanged��6)   . 5T         64   �� *Search+5U      5W      5X      5Y      &   System.Windows.Controls.DataGrid  5[   
   
�������$��0 10 0 0q�5\      $��1��5]         HeadersVisibility$	 All=�5^         SelectionUnit$ FullRow=�5_       J� IsManipulationEnabled .     CanUserDeleteRows .     CanUserAddRows .     AutoGenerateColumns .  ��5[   &   �� *Types+   Columns 5d      0  *System.Windows.Controls.DataGridTextColumn  5e      ,	  &System.Windows.Controls.DataGridColumn 	  
IsReadOnly .  	  Header$ نوع الجهاز��5f   %    	  Width5
  /System.Windows.Controls.DataGridLengthConverter$ 2*
 5g   %     ColumnHeaderStyle7 	  HeaderStyle# [ 5h   %   1  +System.Windows.Controls.DataGridBoundColumn   Binding 5i   %   �� *DeviceType.Name+  5j       . $ 
النوع��5k   %   $ 2*
 5l   %   # [ 5m   %    5n   %   �� *Type+  5o       . $ الساعات��5p   %   $ 1*
 5q   %   # [ 5r   %    5s   %   �� *Hours+  5t       . $ إجمالى الفلوس��5u   %   $ 1*
 5v   %   # [ 5w   %    5x   %   �� *Amount+��5|      �� 5}        MetroDataGrid �� BasedOn# [ 6    �� 
TargetType"  5~      .�5      ��   �� Property   �@ AlternatingRowBackground  GrayBrush10! �� Value#! �  5�      5�      5�      �� 5�   
   $��2��6   .+�5�      �� $ 
Horizontal=�6   .+�5�      ��   TextBlockReportStyle#��[ 6   إجمالى الساعات:5�      �� 5�      #��[ 6   ��6M   �� *
TotalHours+5�      �� 5�      #��[ 6   
ساعة5�      �� 5�      #��[ 6   إجمالى المبلغ :5�      �� 5�      #��[ 6   ��6M   �� *TotalHoursAmount+5�      �� 5�      #��[ 6   
جنيه5�      5�      �� 5�      $ 
Horizontal=�6   .+�5�      �� #��[ 6   (&إجمالى مبلغ الطلبات :5�      �� 5�      #��[ 6   ��6M   �� *TotalItemsAmount+5�      �� 5�      #��[ 6   
جنيه5�      5�      �� 5�      $ 
Horizontal=�6   .+�5�      �� #��[ 6   *(إجمالى مبلغ الخصومات :5�      �� 5�      #��[ 6   ��6M   �� *TotalDiscountsAmount+5�      �� 5�      #��[ 6   
جنيه5�      5�      5�      �� 5�   
   $	��0,5q�6   $��3��5�      $ 
Horizontal=�5�      $��Center=�5�      $��Bottom=�5�      .+�5�      �� $	��5,0q�5�        MetroCircleButtonStyle#���  5�      $��0q�5�      ��5�      �� *Export+.��5�      1  +MahApps.Metro.IconPacks.PackIconSimpleIcons  �  �ControlzEx.PackIconBase`1[[MahApps.Metro.IconPacks.PackIconSimpleIconsKind, MahApps.Metro.IconPacks, Version=1.9.1.0, Culture=neutral, PublicKeyToken=null]]"   Kind$" MicrosoftExcel=�60   $��40��5�   0   $��40��5�   0   5�      5�      5�      5�      
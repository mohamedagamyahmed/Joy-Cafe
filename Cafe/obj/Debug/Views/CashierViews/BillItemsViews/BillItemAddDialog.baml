   M S B A M L   `   `   `  ����?  ;Cafe, Version=0.0.0.1, Culture=neutral, PublicKeyToken=null+clr-namespace:Cafe.HelpersCafe.Helpers  5      U QMahApps.Metro, Version=1.5.0.23, Culture=neutral, PublicKeyToken=f4fb5a3c4d1e5b4fV;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.MetroMahApps.Metro.Controls 5      fCclr-namespace:MahApps.Metro.Controls.Dialogs;assembly=MahApps.MetroMahApps.Metro.Controls.Dialogs 5
      >    8Cafe.Views.CashierViews.BillItemsViews.BillItemAddDialog   5      c _System.Windows.Interactivity, Version=4.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bi:http://schemas.microsoft.com/expression/2010/interactivity  5      (Helpersclr-namespace:Cafe.Helpers  5      b ^GalaSoft.MvvmLight.Platform, Version=5.4.1.0, Culture=neutral, PublicKeyToken=5f873c45e98af8a1-Custom http://www.galasoft.ch/mvvmlight  5      n jSAPBusinessObjects.WPF.ViewerShared, Version=13.0.3500.0, Culture=neutral, PublicKeyToken=692fbea5521e1304R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      PControls;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.Metro     5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      @d2http://schemas.microsoft.com/expression/blend/2008     5	      WdialogsCclr-namespace:MahApps.Metro.Controls.Dialogs;assembly=MahApps.Metro     5
      R	 NMahApps.Metro.IconPacks, Version=1.9.1.0, Culture=neutral, PublicKeyToken=null=	iconPacks-http://metro.mahapps.com/winfx/xaml/iconpacks 	 5      Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006 	 5      1  +MahApps.Metro.Controls.Dialogs.CustomDialog   Language$  ar-EG�5      4  .MahApps.Metro.Controls.Dialogs.BaseMetroDialog   Title$ إضافة طلب��5      $��RightToLeft=�5      8  2MahApps.Metro.Controls.Dialogs.DialogParticipation   Register 5      �� .��5      �� -   5        $	��pnl��5       � 	Resources 5   
    �� MergedDictionaries �� Source�� 5       5      �� 5      $" ..\..\..\Skins\MainSkin.xaml?�6)   %    5      .+�5   
   ��  �� Orientation$ 
Horizontal=�6   .+�5      ��    TextBlockStyle#��[  6   $��Center=�5      $��5q�5      الصنف المختار:65   �� 5!      #��[  6   $��Center=�5"      $��5q�5#      ��5$      �� *SelectedItem.Name+6=   5%      �� 5'   
   -   5        $��First��5(        TextBoxStyle#��[ 5*      !   Cafe.Helpers.FocusExtension   	IsFocused 5'      �� *	IsFocused+��5)      �� *Key+" �� ValidatesOnNotifyDataErrors . 	 �� UpdateSourceTrigger$	 PropertyChanged=�.��5*   9   .  (System.Windows.Interactivity.Interaction
   Triggers
 5+      /  )System.Windows.Interactivity.EventTrigger  5,         	EventName$ TextChanged��6!   .  (System.Windows.Interactivity.TriggerBase   Actions. 5-      /  )GalaSoft.MvvmLight.Command.EventToCommand     Command 6,   �� *Search+5.      .��5/   &   50      �� 52   
   $��12(�6   $
��Bold"�53      
������� �� SelectedValuePath$ ID��56       �� DisplayMemberPath$
 Name��57      $	��150��5:      ��. $��Visible=�5<      $	��0,5q�5=       �� SelectedValue 55      �� *NewBillItem.ItemID+ �� SelectedItem 58      �� *SelectedItem+$	 PropertyChanged=���59      �� *Items+5?      �� 5A   
   $��Center=�6   #��[  6/   $	��0,5q�6W   
السعر6k   *	  $MahApps.Metro.Controls.NumericUpDown	  5B   
   {�.    NumericUpDownStyle#��[ 6�    	  Minimum$
 0.01Q�6�    	  Value 65   �� *SelectedItem.Price+ . $	 PropertyChanged=�5C      �� 5E   
   $��Center=�6   #��[  6/   $	��0,5q�6W   الكمية6l   	  5F   
    	  HasDecimals .  #��[ 6�   $ 1Q�6�    68   �� *NewBillItem.Qty+ . $	 PropertyChanged=�5G      �� 5I   
   $��0 10 0 0q�6   �� 5J   
   $ 
Horizontal=�6   $
��0,10q�6.   .+�5K      �� -   5        $	��btn��5K   &    �� 	IsDefault . $	��5,0q�61     SquareButtonStyle#��[ 6�   $	��100��6�   ��6>   �� *Save+ +� FocusedElement 6W   ��  �� ElementName$ First��.��5L      �� $ 
Horizontal=�6   .+�5M      �� $��حفظ��6!   #��[  6-   $
��10,0q�6U   6e   ,
 	 &MahApps.Metro.IconPacks.PackIconModern
  5N      � 	 �ControlzEx.PackIconBase`1[[MahApps.Metro.IconPacks.PackIconModernKind, MahApps.Metro.IconPacks, Version=1.9.1.0, Culture=neutral, PublicKeyToken=null]]   Kind$
 Save=�6/   5O      5P      �� 5Q       �� IsCancel . $	��5,0q�6%   $	��Add��6R   #��[ 6i   $	��100��6�   ��62   �� *CloseDialog+.��5R      �� $ 
Horizontal=�6   .+�5S      �� $��
إغلاق��6!   #��[  6/   $
��10,0q�6W   6g   
  5T      $ Cancel=�6/   5U      5V      5W      5X      5Y      
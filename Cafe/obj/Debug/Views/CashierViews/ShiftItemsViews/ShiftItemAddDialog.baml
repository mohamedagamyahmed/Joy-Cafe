   M S B A M L   `   `   `  ����?  ;Cafe, Version=0.0.0.1, Culture=neutral, PublicKeyToken=null+clr-namespace:Cafe.HelpersCafe.Helpers  5      U QMahApps.Metro, Version=1.5.0.23, Culture=neutral, PublicKeyToken=f4fb5a3c4d1e5b4fV;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.MetroMahApps.Metro.Controls 5      fCclr-namespace:MahApps.Metro.Controls.Dialogs;assembly=MahApps.MetroMahApps.Metro.Controls.Dialogs 5
      @    :Cafe.Views.CashierViews.ShiftItemsViews.ShiftItemAddDialog   5      c _System.Windows.Interactivity, Version=4.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bi:http://schemas.microsoft.com/expression/2010/interactivity  5      (Helpersclr-namespace:Cafe.Helpers  5      b ^GalaSoft.MvvmLight.Platform, Version=5.4.1.0, Culture=neutral, PublicKeyToken=5f873c45e98af8a1-Custom http://www.galasoft.ch/mvvmlight  5      n jSAPBusinessObjects.WPF.ViewerShared, Version=13.0.3500.0, Culture=neutral, PublicKeyToken=692fbea5521e1304R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      PControls;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.Metro     5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      @d2http://schemas.microsoft.com/expression/blend/2008     5	      WdialogsCclr-namespace:MahApps.Metro.Controls.Dialogs;assembly=MahApps.Metro     5
      R	 NMahApps.Metro.IconPacks, Version=1.9.1.0, Culture=neutral, PublicKeyToken=null=	iconPacks-http://metro.mahapps.com/winfx/xaml/iconpacks 	 5      Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006 	 5      1  +MahApps.Metro.Controls.Dialogs.CustomDialog   Language$  ar-EG�5      4  .MahApps.Metro.Controls.Dialogs.BaseMetroDialog   Title$ إضافة طلب��5      $��RightToLeft=�5      8  2MahApps.Metro.Controls.Dialogs.DialogParticipation   Register 5      �� .��5      �� -   5        $	��pnl��5       � 	Resources 5   
    �� MergedDictionaries �� Source�� 5       5      �� 5      $" ..\..\..\Skins\MainSkin.xaml?�6)   %    5      .+�5   
   ��  �� Orientation$ 
Horizontal=�6   .+�5      ��    TextBlockStyle#��[  6   $��Center=�5      $��5q�5      الصنف المختار:65   �� 5!      #��[  6   $��Center=�5"      $��5q�5#      ��5$      �� *SelectedItem.Name+6=   5%      �� 5'   
   -   5        $��First��5'   J     TextBoxStyle#��[ 5(      !   Cafe.Helpers.FocusExtension   	IsFocused 5'      �� *	IsFocused+��6X   �� *Key+" �� ValidatesOnNotifyDataErrors . 	 �� UpdateSourceTrigger$	 PropertyChanged=�.��5(   ;   .  (System.Windows.Interactivity.Interaction
   Triggers
 5)      /  )System.Windows.Interactivity.EventTrigger  5*         	EventName$ TextChanged��6!   .  (System.Windows.Interactivity.TriggerBase   Actions. 5+      /  )GalaSoft.MvvmLight.Command.EventToCommand     Command 6,   �� *Search+5,      .��5-   &   5.      �� 50   
   $��12(�6   $
��Bold"�51      
������� �� SelectedValuePath$ ID��54       �� DisplayMemberPath$
 Name��55      $	��150��58      ��. $��Visible=�5:      $	��0,5q�5;       �� SelectedValue 53      �� *NewShiftItem.ItemID+ �� SelectedItem 56      �� *SelectedItem+$	 PropertyChanged=���57      �� *Items+5=      �� 5?   
   $��Center=�6   #��[  6/   $	��0,5q�6W   
السعر6k   *	  $MahApps.Metro.Controls.NumericUpDown	  5@      {�.    NumericUpDownStyle#��[ 6�    	  Minimum$
 0.01Q�6�    	  Value 69   �� *SelectedItem.Price+ . $	 PropertyChanged=�5A      �� 5C      $��Center=�6   #��[  63   $	��0,5q�6[   الكمية6p   	  5D   
    	  HasDecimals .  #��[ 6�   $ 1Q�6�    68   �� *NewShiftItem.Qty+ . $	 PropertyChanged=�5E      �� 5G   
   $��0 10 0 0q�6   �� 5H   
   $ 
Horizontal=�6   $
��0,10q�6.   .+�5I      �� -   5        $	��btn��5I   &    �� 	IsDefault . $	��5,0q�61     SquareButtonStyle#��[ 6�   $	��100��6�   ��6>   �� *Save+ +� FocusedElement 6W   ��  �� ElementName$ First��.��5J      �� $ 
Horizontal=�6   .+�5K      �� $��حفظ��6!   #��[  6-   $
��10,0q�6U   6e   ,
 	 &MahApps.Metro.IconPacks.PackIconModern
  5L      � 	 �ControlzEx.PackIconBase`1[[MahApps.Metro.IconPacks.PackIconModernKind, MahApps.Metro.IconPacks, Version=1.9.1.0, Culture=neutral, PublicKeyToken=null]]   Kind$
 Save=�6/   5M      5N      �� 5O       �� IsCancel . $	��5,0q�6%   $	��Add��6R   #��[ 6i   $	��100��6�   ��62   �� *CloseDialog+.��5P      �� $ 
Horizontal=�6   .+�5Q      �� $��
إغلاق��6!   #��[  6/   $
��10,0q�6W   6g   
  5R      $ Cancel=�6/   5S      5T      5U      5V      5W      
   M S B A M L   `   `   `  ����?  ;Cafe, Version=0.0.0.1, Culture=neutral, PublicKeyToken=null+clr-namespace:Cafe.HelpersCafe.Helpers  5      U QMahApps.Metro, Version=1.5.0.23, Culture=neutral, PublicKeyToken=f4fb5a3c4d1e5b4ffCclr-namespace:MahApps.Metro.Controls.Dialogs;assembly=MahApps.MetroMahApps.Metro.Controls.Dialogs 5      :    4Cafe.Views.MembershipViews.ClientMembershipAddDialog   5      &Helpersclr-namespace:Cafe.Helpers  5      c _System.Windows.Interactivity, Version=4.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bi:http://schemas.microsoft.com/expression/2010/interactivity  5      b ^GalaSoft.MvvmLight.Platform, Version=5.4.1.0, Culture=neutral, PublicKeyToken=5f873c45e98af8a1-Custom http://www.galasoft.ch/mvvmlight  5      n jSAPBusinessObjects.WPF.ViewerShared, Version=13.0.3500.0, Culture=neutral, PublicKeyToken=692fbea5521e1304R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      WdialogsCclr-namespace:MahApps.Metro.Controls.Dialogs;assembly=MahApps.Metro     5      R	 NMahApps.Metro.IconPacks, Version=1.9.1.0, Culture=neutral, PublicKeyToken=null=	iconPacks-http://metro.mahapps.com/winfx/xaml/iconpacks 	 5	      Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006 	 5
      4  .MahApps.Metro.Controls.Dialogs.BaseMetroDialog    Title$(  "إضافة اشتراك عضوية��5      $��RightToLeft=�5      8  2MahApps.Metro.Controls.Dialogs.DialogParticipation   Register 5      �� .��5      �� -   5        $	��pnl��5      $��10q�6    � 	Resources 5   
    �� MergedDictionaries �� Source�� 5       5      �� 5      $ ..\..\Skins\MainSkin.xaml?�6)   %    5      .+�5   
   ��    TextBlockStyle#��[  6   $	��0,5q�6<   العميل6Q   �� 5   
   -   5        $��First��5   J    �� SelectedValuePath$ ID��6x    �� DisplayMemberPath$
 Name��6�    �� 
IsEditable .   ComboBoxStyle#��[ 5   �   !   Cafe.Helpers.FocusExtension   	IsFocused 5      �� *	IsFocused+��6X   �� *	Clients+	 �� SelectedItem	 6�   �� *SelectedClient+
 �� SelectedValue
 5      �� *NewClientMembership.ClientID+" �� ValidatesOnNotifyDataErrors .  �� UpdateSourceTrigger$ PropertyChanged=�5      �� 5   
   #��[  6   $	��0,5q�6<   
النوع6P   �� 5   
   $ ID��69   $
 Name��6|    . #��[ 5    �   ��5      �� *DevicesTypes+	 6P   �� *SelectedDeviceType+
 5       �� *" NewClientMembership.DeviceTypeID+ . $ PropertyChanged=�.  (System.Windows.Interactivity.Interaction   Triggers 5!      /  )System.Windows.Interactivity.EventTrigger  5"         	EventName$ SelectionChanged��6!   .  (System.Windows.Interactivity.TriggerBase   Actions. 5#      /  )GalaSoft.MvvmLight.Command.EventToCommand     Command 6,   �� *GetMemberships+5$      5&      �� 5(   
   #��[  6   $	��0,5q�6<   العضوية6R   �� 5)   
   $ ID��69   $
 Name��6|    . #��[ 5*   �   ��5)      �� *Memberships+	 6P   �� *SelectedMembership+
 5*      �� *" NewClientMembership.MembershipID+ . $ PropertyChanged=�5+      �� 5-   
   #��[  6   $	��0,5q�6<   
السعر6P   �� 5.   
   {�.    TextBoxStyle#��[ 6�   ��6&   �� *SelectedMembership.Price+ . $ PropertyChanged=�6�   �� 50   
   #��[  6   $	��0,5q�6<   الدقائق6R   �� 51   
   {�.  #��[ 6�   ��6&   �� *SelectedMembership.Minutes+$ PropertyChanged=� . 6�   �� 53   
   $��0 15 0 0q�6   �� 54   
    �� Orientation$ 
Horizontal=�6   $��0 10 0 0q�6.   .+�55      �� -   5        $	��btn��55   &    �� 	IsDefault .   SquareButtonStyle#��[ 6�   $	��100��6�   ��61   �� *Save+ +� FocusedElement 6J   ��  �� ElementName$ First��.��56      �� $ 
Horizontal=�6   .+�57      �� $��حفظ��6!   #��[  6-   $
��10,0q�6U   6e   , 	 &MahApps.Metro.IconPacks.PackIconModern  58      �	 	 �ControlzEx.PackIconBase`1[[MahApps.Metro.IconPacks.PackIconModernKind, MahApps.Metro.IconPacks, Version=1.9.1.0, Culture=neutral, PublicKeyToken=null]] 	  Kind$
 Save=�6/   59      5:      �� 5;       �� IsCancel . $	��Add��6E   #��[ 6\   $	��100��6�   $
��10,0q�6�   ��6%   �� *CloseDialog+.��5<      �� $ 
Horizontal=�6   .+�5=      �� $��
إغلاق��6!   #��[  6/   $
��10,0q�6W   6g     5>      $ Cancel=�6/   5?      5@      5A      5B      5D      
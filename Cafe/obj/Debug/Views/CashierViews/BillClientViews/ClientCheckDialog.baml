   M S B A M L   `   `   `  ����?  ;Cafe, Version=0.0.0.1, Culture=neutral, PublicKeyToken=null+clr-namespace:Cafe.HelpersCafe.Helpers  5      Q MWPFTextBoxAutoComplete, Version=1.0.0.2, Culture=neutral, PublicKeyToken=null_Dclr-namespace:WPFTextBoxAutoComplete;assembly=WPFTextBoxAutoCompleteWPFTextBoxAutoComplete 5      U QMahApps.Metro, Version=1.5.0.23, Culture=neutral, PublicKeyToken=f4fb5a3c4d1e5b4ffCclr-namespace:MahApps.Metro.Controls.Dialogs;assembly=MahApps.MetroMahApps.Metro.Controls.Dialogs 5      ?    9Cafe.Views.CashierViews.BillClientViews.ClientCheckDialog   5      &Helpersclr-namespace:Cafe.Helpers  5      n jSAPBusinessObjects.WPF.ViewerShared, Version=13.0.3500.0, Culture=neutral, PublicKeyToken=692fbea5521e1304R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      Z	behaviorsDclr-namespace:WPFTextBoxAutoComplete;assembly=WPFTextBoxAutoComplete     5      WdialogsCclr-namespace:MahApps.Metro.Controls.Dialogs;assembly=MahApps.Metro     5      R NMahApps.Metro.IconPacks, Version=1.9.1.0, Culture=neutral, PublicKeyToken=null=	iconPacks-http://metro.mahapps.com/winfx/xaml/iconpacks  5      Dmc;http://schemas.openxmlformats.org/markup-compatibility/2006  5	      4  .MahApps.Metro.Controls.Dialogs.BaseMetroDialog    Title$]  Wالرجاء إضافة رقم هاتف العميل لإتمام عملية الدفع��5      $��RightToLeft=�5      8  2MahApps.Metro.Controls.Dialogs.DialogParticipation   Register 5
      �� .��5      �� -   5        $	��pnl��5      $��10q�6    � 	Resources 5   
    �� MergedDictionaries �� Source�� 5       5      �� 5      $" ..\..\..\Skins\MainSkin.xaml?�6)   %    5      .+�5   
   ��    TextBlockStyle#��[  6   $	��0,5q�6<   التليفون6S   �� 5   
   -   5        $��First��5        TextBoxStyle#��[ 6  !   Cafe.Helpers.FocusExtension   	IsFocused 6   �� *	IsFocused+1  +WPFTextBoxAutoComplete.AutoCompleteBehavior   AutoCompleteItemsSource 6V   �� *TelephoneSuggestions+��6�   �� *ClientCheck.Telephone+" �� ValidatesOnNotifyDataErrors .  �� UpdateSourceTrigger$ PropertyChanged=�.��6B  5      �� 5   
   -   5        $	��btn��5   "   	 �� 	IsDefault	 . $	��0,5q�6-   $
��Left=�6Z     SquareButtonStyle#��[ 6w   $	��100��6�   ��6:   �� *CheckClient+.��5      �� 
 �� Orientation$
 
Horizontal=�6   .+�5      �� $	��Add��6   #��[  6)   $
��10,0q�6Q   6a   .  (MahApps.Metro.IconPacks.PackIconMaterial  5       �  �ControlzEx.PackIconBase`1[[MahApps.Metro.IconPacks.PackIconMaterialKind, MahApps.Metro.IconPacks, Version=1.9.1.0, Culture=neutral, PublicKeyToken=null]]   Kind$ AccountSearch=�6-   5!      5"      �� 5%   
   $	��0,5q�6   �� 5'   
   $��1��6   $��3��6"   $
 
Horizontal=�66   .+�5)      ��   TextBlockAddUpdateStyle#��[ 6   $	��5,0q�6J   $��16(�6W   إجمالى الأجهزة:5+      �� 5-      $��16(�6   #��[ 6[   $	��5,0q�6�   ��6&   �� *
DevicesSum+ �� StringFormat$ 	{0:0;(0)}��6�   �� 5/      #��[ 6   $	��5,0q�6I   $��16(�6V   جنيهاً6l   �� 52      $��16(�6   #��[ 6&   $	��5,0q�6W   إجمالى الطلبات:54      �� 56      $��16(�6   #��[ 6Y   $	��5,0q�6�   ��6&   �� *
ItemsSum+$ 	{0:0;(0)}��6�   �� 58      #��[ 6   $	��5,0q�6I   $��16(�6V   جنيهاً6l   �� 5:      $��16(�6   #��[ 6&   $	��5,0q�6W   الإجمالى:5<      �� 5>      $��16(�6   #��[ 6Y   $	��5,0q�6�   ��6&   �� *
TotalSum+$ 	{0:0;(0)}��6�   �� 5@      #��[ 6   $	��5,0q�6I   $��16(�6V   جنيهاً6l   5B      �� 5D   
   $��0 5 0 0q�6   �� 5F   
   $
 
Horizontal=�6   $��0 10 0 0q�6.   .+�5H      ��  �� IsCancel . $��ClientCheck��6E   #��[ 6d   $	��100��6�   $
��10,0q�6�   ��6%   �� *CloseDialog+.��5I      �� $
 
Horizontal=�6   .+�5J      �� $��
إغلاق��6!   #��[  6/   $
��10,0q�6W   6g   ,  &MahApps.Metro.IconPacks.PackIconModern  5K      �  �ControlzEx.PackIconBase`1[[MahApps.Metro.IconPacks.PackIconModernKind, MahApps.Metro.IconPacks, Version=1.9.1.0, Culture=neutral, PublicKeyToken=null]]   Kind$ Cancel=�6/   5L      5M      5N      5P      5R      
   M S B A M L   `   `   `  ����U  QMahApps.Metro, Version=1.5.0.23, Culture=neutral, PublicKeyToken=f4fb5a3c4d1e5b4fV;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.MetroMahApps.Metro.Controls  5   	   ? ;Cafe, Version=0.0.0.1, Culture=neutral, PublicKeyToken=nullG(clr-namespace:Cafe.Views.MembershipViewsCafe.Views.MembershipViews 5   	   [2clr-namespace:Cafe.ViewModels.MembershipViewModels$Cafe.ViewModels.MembershipViewModels 5   	   ?$clr-namespace:Cafe.Views.ClientViewsCafe.Views.ClientViews 5      S.clr-namespace:Cafe.ViewModels.ClientViewModels Cafe.ViewModels.ClientViewModels 5	   	   1   +Cafe.Views.MembershipViews.MembershipWindow   5      HControls;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.Metro  5   	   n jSAPBusinessObjects.WPF.ViewerShared, Version=13.0.3500.0, Culture=neutral, PublicKeyToken=692fbea5521e1304R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   :views(clr-namespace:Cafe.Views.MembershipViews     5   	   I
viewModels2clr-namespace:Cafe.ViewModels.MembershipViewModels     5   	   7viewss$clr-namespace:Cafe.Views.ClientViews     5      FviewModelss.clr-namespace:Cafe.ViewModels.ClientViewModels     5	   	     � Title$  العضويات��5
   	   $
��1000��5   	   $
��1024��5   	   (   "MahApps.Metro.Controls.MetroWindow   ShowTitleBar .  � WindowState$ 	Maximized=�5   	   $��RightToLeft=�5   	    � DataContext 5   	   �� *
Membership+   Locator �� Source# [   � 	Resources 5       �� DataType=  7Cafe.ViewModels.ClientViewModels.ClientDisplayViewModel5  /Cafe.Views.ClientViews.ClientDisplayUserControlE  ?Cafe.ViewModels.MembershipViewModels.MembershipDisplayViewModel=  7Cafe.Views.MembershipViews.MembershipDisplayUserControlD  >Cafe.ViewModels.MembershipViewModels.ClientMembershipViewModel<  6Cafe.Views.MembershipViews.ClientMembershipUserControlJ  DCafe.ViewModels.MembershipViewModels.ClientMembershipMinuteViewModelB	  <Cafe.Views.MembershipViews.ClientMembershipMinuteUserControl �� MergedDictionaries �� Source�� 5   
    5       �� 5!      $ ..\..\Skins\MainSkin.xaml?�6%   %,  (��       5      *, +)(�� 2     5      *, +)(�� d     5      *, +)(�� �     5      *, +)�� 5      "  6   .R�5        5      �� 5      "  6   .R�5        5      �� 5      "  6   .R�5        5      �� 5      "  6   .R�5      	  5      5#      .��5&      � 	 � RowDefinitions	 5'   
   �� 5(      $
��1.8* �6   �� 5)      $
��8.2* �6   .+�5,   
   �� 
 �� Orientation$
 
Horizontal=�6   $��5q�6.   .+�5.      !
   MahApps.Metro.Controls.Tile
  ���#808000$��ClientDisplay��6T    
  Title$ العملاء��6u    
  HorizontalTitleAlignment$ Center=�6�    
  VerticalTitleAlignment$ Center=�6�     
BlackBrush+   %MahApps.Metro.Controls.ControlsHelper   MouseOverBorderBrush# �  6�     NormalTileStyle#��[ 6  ��61   �� *NavigateToView+5/      
  51      ���#008000$��
Membership��6T   $ العضويات��6r   $ Center=�6�   $ Center=�6�   # �  6�   #��[ 6  ��61   �� *NavigateToView+52      
  54      ���#000080$��ClientMembership��6T   $' !اشتراكات العضويات��6x   $ Center=�6�   $ Center=�6�   # �  6�   #��[ 6"  ��61   �� *NavigateToView+55      
  57      ���#800080$��ClientMembershipMinute��6T   $! دقائق العضويات��6~   $ Center=�6�   $ Center=�6�   # �  6�   #��[ 6%  ��61   �� *NavigateToView+58      5:      �� 5<   
   $��1��6   $	��Top=�6"   �� 5=   
   $��1��6?   ��6   �� *CurrentViewModel+6?   5>      5@      
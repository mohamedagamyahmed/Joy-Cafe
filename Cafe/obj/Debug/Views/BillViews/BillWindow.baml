   M S B A M L   `   `   `  ����U  QMahApps.Metro, Version=1.5.0.23, Culture=neutral, PublicKeyToken=f4fb5a3c4d1e5b4fV;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.MetroMahApps.Metro.Controls  5   	   ? ;Cafe, Version=0.0.0.1, Culture=neutral, PublicKeyToken=null;"clr-namespace:Cafe.Views.BillViewsCafe.Views.BillViews 5   	   O,clr-namespace:Cafe.ViewModels.BillViewModelsCafe.ViewModels.BillViewModels 5   	   %   Cafe.Views.BillViews.BillWindow   5      HControls;clr-namespace:MahApps.Metro.Controls;assembly=MahApps.Metro  5   	   n jSAPBusinessObjects.WPF.ViewerShared, Version=13.0.3500.0, Culture=neutral, PublicKeyToken=692fbea5521e1304R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   4views"clr-namespace:Cafe.Views.BillViews     5   	   C
viewModels,clr-namespace:Cafe.ViewModels.BillViewModels     5   	     � Title$  الفواتير��5   	   $
��1000��5	   	   $
��1024��5
   	   (   "MahApps.Metro.Controls.MetroWindow   ShowTitleBar .  � WindowState$ 	Maximized=�5   	   $��RightToLeft=�5   	    � DataContext 5   	   �� *Bill+   Locator �� Source# [   � 	Resources 5       �� DataType9  3Cafe.ViewModels.BillViewModels.BillDisplayViewModel1  +Cafe.Views.BillViews.BillDisplayUserControl5  /Cafe.ViewModels.BillViewModels.BillDayViewModel-  'Cafe.Views.BillViews.BillDayUserControl �� MergedDictionaries �� Source�� 5   
    5      �� 5      $ ..\..\Skins\MainSkin.xaml?�6%   %�   (��       5      *, +)(�� 2     5      *, +)�� 5      "  6   .R�5        5      �� 5      "  6   .R�5        5      5      .��5      � 	 � RowDefinitions	 5   
   �� 5       $
��1.8* �6   �� 5!      $
��8.2* �6   .+�5$   
   �� 
 �� Orientation$
 
Horizontal=�6   $��5q�6.   .+�5&      !   MahApps.Metro.Controls.Tile  ���#000080$��BillDisplay��6T      Title$ الفواتير��6s      HorizontalTitleAlignment$ Center=�6�      VerticalTitleAlignment$ Center=�6�     
BlackBrush+   %MahApps.Metro.Controls.ControlsHelper   MouseOverBorderBrush# �  6�     NormalTileStyle#��[ 6  ��61   �� *NavigateToView+5'        5)      ���#008000$��BillDay��6T   $ 
اليوم��6o   $ Center=�6}   $ Center=�6�   # �  6�   #��[ 6  ��61   �� *NavigateToView+5*      5,      �� 5.   
   $��1��6   $	��Top=�6"   �� 5/   
   $��1��6?   ��6   �� *CurrentViewModel+6?   50      52      
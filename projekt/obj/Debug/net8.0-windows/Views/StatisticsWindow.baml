   M S B A M L   `   `   `  ����B  >projekt, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null-clr-namespace:projekt.Viewsprojekt.Views  5   	   $    projekt.Views.StatisticsWindow   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   -localclr-namespace:projekt.Views     5   	     � Title$  
Statistics��5   	   $	��500��6   $	��700��6)    � WindowStartupLocation$ CenterOwner=�5	   	   .��5
      � $��20q�6   ���#fafbfc � RowDefinitions 5   
   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $��* �6   .+�5   
   �� $��0��6   $��Database Statistics��6!   $��24(�5      $
��Bold"�6"   $��0,0,0,20q�5      ���#2d37486&   �� 5   
   $��1��6    �� Orientation$ 
Horizontal=�6"   $��0,0,0,20q�6;   .+�5      �� $��Duration Stats��6   ���#3182ce
�������$
��10,5q�5      $��0q�6$   $��0,0,10,0q�68   ��5   .   �� *DurationStatsCommand+5   8   �� 5      $��Top 5 Rated��6   ���#3182ce
�������$
��10,5q�5      $��0q�6$   $��0,0,10,0q�68   ��5   +   �� *Top5RatedCommand+5   8   �� 5      $��Rating by Genre��6   ���#3182ce
�������$
��10,5q�5       $��0q�6$   ��5   /   �� *RatingByGenreCommand+5    $   5!      &   System.Windows.Controls.DataGrid  5$   
   $��2��6      AutoGenerateColumns$
 True��5%         CanUserAddRows$ False��5&         GridLinesVisibility$ 
Horizontal=�5'         AlternatingRowBackground �#f8f9fa��5$       �� *StatisticsResults+5(      5)      5*      
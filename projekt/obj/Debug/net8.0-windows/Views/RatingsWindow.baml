   M S B A M L   `   `   `  ����B  >projekt, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null-clr-namespace:projekt.Viewsprojekt.Views  5   	   !    projekt.Views.RatingsWindow   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   -localclr-namespace:projekt.Views     5   	     � Title$  Movie Ratings��5   	   $	��600��6   $	��700��6,    � WindowStartupLocation$ CenterOwner=�5   	    � 
ResizeMode$ 	CanResize=�5   	   .��5      � $��20q�6    � RowDefinitions 5	   
   �� 5
      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $��* �6   �� 5      $
��Auto �6   .+�5   
   �� $��0��6   $��Movie Ratings��6!   $��24(�5      $
��Bold"�6"   $��0,0,0,20q�5      ���#2d37486&   �� 5   
   $��1��6   ���#f8f9fa �� Padding$ 15q�63   $��0,0,0,20q�6@    �� CornerRadius$ 5��6R   ._�5      �� .+�5      �� $��18(�6   $��SemiBold"�6*   ���#2d3748�� 5      $�Movie: ��6    �� 5      �6   �� *
MovieTitle+5      �� 5      $��14(�6   ���#718096$��0,5,0,0q�6?   �� 5      $�Average Rating: ��6    �� 5      �6   �� *AverageRating+ �� StringFormat$ F1�� �� 5       $� (��6    �� 5!      �6   �� *TotalRatings+ �� 5"      $�	 ratings)��6   5#      5$      5%      �� 5(   
   $��2��6    �� Orientation$ 
Horizontal=�6"   $��0,0,0,15q�6;   .+�5)      �� $��➕ Add Rating��6   ���#38a169
�������$
��12,8q�5+      $��0q�6$   $��0,0,10,0q�68   ��5)   ,   �� *AddRatingCommand+5+   8   �� 5,      $��🗑️ Delete Rating��6   ���#e53e3e
�������$
��12,8q�5.      $��0q�6$   $��0,0,10,0q�68   ��5,   1   �� *DeleteRatingCommand+{�5/      �� *SelectedRating+%   projekt.Views.BooleanConverters   	IsNotNull	 �� 	Converter#	 Z �� 50      $��💾 Save Changes��6   ���#ffa500
�������$
��12,8q�52      $��0q�6$   $��0,0,10,0q�68   ��50   /   �� *SaveCommand+{�53      �� *
HasChanges+54      &   System.Windows.Controls.DataGrid  57   
   -   5        $��3��57      
   AutoGenerateColumns$
 False��59         CanUserAddRows$ False��5:         GridLinesVisibility$ 
Horizontal=�5;         AlternatingRowBackground �#f8f9fa��57       �� *	Ratings+ �� SelectedItem 58      �� *SelectedRating+   Columns 5>      0  *System.Windows.Controls.DataGridTextColumn  5?      ,  &System.Windows.Controls.DataGridColumn   Header$
 User��6%      Width5  /System.Windows.Controls.DataGridLengthConverter$ * 6P      
IsReadOnly$
 True��6Z   1  +System.Windows.Controls.DataGridBoundColumn   Binding 63   �� *
UserName+6Z     5@      $ Email��6%   $ * 6R   $
 True��6\    64   �� *	UserEmail+6\     5A      $ Rating��6%   $	 100 6o   $ False��6{    65   �� *Rating+ �� UpdateSourceTrigger$ 	LostFocus=�   ElementStyle 5B      �� 5C       �� 
TargetType" ��6    .�5D      ��  �� Property �@��TextAlignment �� Value$ Center=�6>   5E         EditingElementStyle 5G      �� 5H      " ��6    .�5I      ��  �@��TextAlignment$ Center=�6>   5J      5L        5M      $ Rated At��6%   $	 150 6r   $
 True��6~    67   �� *	RatedAt+$ yyyy-MM-dd HH:mm��6~   5O      �� 5R   
   $��4��6   $ 
Horizontal=�6"   $��Right=�5S      $��0,20,0,0q�61   .+�5T      �� -   5        $��Close��5T      ���#a0aec0
�������$
��20,8q�5V      $��0q�6$   5W      5X      5Y      
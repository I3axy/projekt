   M S B A M L   `   `   `  ����B  >projekt, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null-clr-namespace:projekt.Viewsprojekt.Views  5          projekt.Views.ActorsView   5      W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      -localclr-namespace:projekt.Views     5      .��5	      � ���#fafbfc  � RowDefinitions  5
   
   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $��* �6   .+�5   
   �� $��0��6   $��Actors Management��6!   $��24(�5      $
��Bold"�6"   $��10q�5      ���#2d37486    �� 5   
   $��1��6    �� Orientation$ 
Horizontal=�6"   $��10q�6;   .+�5      �� $	��200��5      $��30��6"   $��Center=�5      $��0,0,10,0q�5      ��5      �� *
SearchText+ �� UpdateSourceTrigger$ PropertyChanged=�5      �� 5      $��Search��6   ���#3182ce
�������$
��10,5q�5      $��0q�6$   $��0,0,10,0q�68   ��5   &   �� *SearchCommand+5   8   �� 5      $��	Add Actor��6   ���#38a169
�������$
��10,5q�5       $��0q�6$   $��0,0,10,0q�68   ��5   )   �� *
AddCommand+5    8   �� 5#      $��💾 Save Changes��6   ���#ffa500
�������$
��10,5q�5%      $��0q�6$   $��0,0,10,0q�68   ��5#   /   �� *SaveCommand+{�5&      �� *
HasChanges+�� 5)      $��Delete��6   ���#e53e3e
�������$
��10,5q�5+      $��0q�6$   ��5)   &   �� *DeleteCommand+5+   $   5,      &   System.Windows.Controls.DataGrid  5/   
   -   5        $��2��5/         AutoGenerateColumns$ False��51         CanUserAddRows$ False��52         GridLinesVisibility$ 
Horizontal=�53         AlternatingRowBackground �#f8f9fa$��10q�55      ��5/       �� *Actors+ �� SelectedItem 50      �� *SelectedActor+   Columns 57      0  *System.Windows.Controls.DataGridTextColumn  58      ,  &System.Windows.Controls.DataGridColumn	   Header$	 	Full Name��6%   
   Width5  /System.Windows.Controls.DataGridLengthConverter$
 2* 6t      
IsReadOnly$ False��6   1  +System.Windows.Controls.DataGridBoundColumn   Binding 68   �� *
FullName+$ 	LostFocus=�6     59      $	 
Birth Date��6%   $
 * 6�   $ False��6�    69   �� *	BirthDate+ �� StringFormat$ 
yyyy-MM-dd��$ 	LostFocus=�6�     5:      $	 Nationality��6%   $
 * 6y   $ False��6�    6:   �� *Nationality+$ 	LostFocus=�6�     5;      $	 Gender��6%   $
 * 6o   $ False��6y    65   �� *Gender+$ 	LostFocus=�6y   5=      5>      5?      
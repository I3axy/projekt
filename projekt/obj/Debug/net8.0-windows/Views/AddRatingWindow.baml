   M S B A M L   `   `   `  ����  projekt#    projekt.Views.AddRatingWindow   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	     � Title$  
Add Rating��5   	   $	��400��6   $	��450��6)    � WindowStartupLocation$ CenterOwner=�5   	    � 
ResizeMode$ NoResize=�5   	   .��5      � $��20q�6    � RowDefinitions 5   
   �� 5	      $
��Auto �6   �� 5
      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $��* �6   �� 5      $
��Auto �6   .+�5   
   �� $��0��6   $��Add New Rating��6!   $��18(�5      $
��Bold"�6"   $��0,0,0,20q�5      ���#2d37486&   �� 5   
   $��1��6   $��Select User:��6!   $��SemiBold"�65   $��0,0,0,5q�6K   �� 5   
   -   5         ��Name$ UserComboBox��5       $��2��6   $��35��5      $��14(�6   $��0,0,0,20q�6-    �� DisplayMemberPath$
 Name��5       �� SelectedValuePath$ UserID��5      $��8q�5      �� 5   
   $��3��6   $��Rating:��6!   $��SemiBold"�60   $��0,0,0,5q�6F   �� 5   
   -   5         ��Name$ RatingSlider��5      $��4��6    � Minimum$ 1Q�5       	 � Maximum$	 5Q�6   
 � Value$
 3Q�6)    �� TickFrequency$ 1Q�5!       �� TickPlacement$ BottomRight=�6#    �� IsSnapToTickEnabled$
 True��5"      $��0,0,0,10q�5#      �� 5%   
   $��5��6   $��Center=�6!   $��16(�6>   $��SemiBold"�6L   $��0,0,0,20q�6b   �� 5&      $�Rating: ��6    �� 5'      �6   ��  �� ElementName$ RatingSlider�� �� Path$ Value� �� StringFormat$ F0�� �� 5(      $
� / 5��6   5)      �� 5+   
   $��7��6    �� Orientation$ 
Horizontal=�6"   $��Right=�5,      $��0,30,0,0q�61   .+�5-      �� -   5        $
��Save��5-      ���#38a169
�������$
��20,8q�5/      $��0,0,10,0q�6$   $��0q�66   �� 50      -   5        $��Cancel��50      ���#a0aec0
�������$
��20,8q�52      $��0q�6$   53      54      55      
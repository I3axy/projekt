   M S B A M L   `   `   `  ����  projekt"    projekt.Views.AddMovieWindow   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	     � Title$  	Add Movie��5   	   $	��450��6   $	��400��6(    � WindowStartupLocation$ CenterOwner=�5   	    � 
ResizeMode$ NoResize=�5   	   .��5      � $��20q�6   ���#fafbfc � RowDefinitions 5   
   �� 5	      $
��Auto �6   �� 5
      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $��* �6   �� 5      $
��Auto �6   .+�5   
   �� $��0��6   $��Add New Movie��6!   $��18(�5      $
��Bold"�6"   $��0,0,0,20q�5      ���#2d37486&   �� 5   
   $��1��6   $��Title:��6!   $��SemiBold"�6/   $��0,0,0,5q�6E   �� 5   
   -   5         ��Name$ TitleTextBox��5      $��2��6   $��8q�5      $��35��6   $��14(�6*   $��0,0,0,15q�68   �� 5   
   $��3��6   $��Release Date:��6!   $��SemiBold"�66   $��0,0,0,5q�6L   (  "System.Windows.Controls.DatePicker  5   
   -   5          Name$ ReleaseDatePicker��5   "   $��4��6   $��35��5      $��14(�6!   $��0,0,0,15q�6/   �� 5!   
   $��5��6   $��Duration (minutes):��6!   $��SemiBold"�6<   $��0,0,0,5q�6R   �� 5"   
   -   5        $ DurationTextBox��5"      $��6��6   $��8q�5#      $��35��6   $��14(�6*   $��0,0,0,15q�68   �� 5%   
   $��7��6   $��	Synopsis:��6!   $��SemiBold"�62   $��0,0,0,5q�6H   �� 5&   
   -   5        $ SynopsisTextBox��5&      $��8��6   $��8q�5'      $��14(�6   $��0,0,0,15q�6,    �� TextWrapping$
 Wrap=�5(       �� AcceptsReturn$
 True��6&   �� 5*   
   $��9��6    �� Orientation$ 
Horizontal=�6"   $��Right=�5+      $��0,20,0,0q�61   .+�5,      �� -   5        $
��Save��5,      ���#38a169
�������$
��20,8q�5.      $��0,0,10,0q�6$   $��0q�66   �� 5/      -   5        $��Cancel��5/      ���#a0aec0
�������$
��20,8q�51      $��0q�6$   52      53      54      
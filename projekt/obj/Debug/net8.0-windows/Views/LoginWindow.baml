   M S B A M L   `   `   `  ����  projekt    projekt.Views.LoginWindow   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	     � Title$*  $Film Database Management App - Login��5   	   $	��500��66   $	��450��6C    � WindowStartupLocation$ CenterScreen=�5   	    � 
ResizeMode$ NoResize=�5   	   .��5      � ���#2d3748 � RowDefinitions 5   
   �� 5	      $��* �6   �� 5
      $
��Auto �6   �� 5      $��* �6   .+�5   
   �� $��1��6   
������� �� CornerRadius$ 10��61   $��30q�5       �� Padding$ 40q�6    J� Effect 5      3  -System.Windows.Media.Effects.DropShadowEffect  5         Color$
 Gray��6#      	Direction$	 320Q�60   	   ShadowDepth$	 3Q�6@   
   
BlurRadius$
 5Q�6P      Opacity$	 0.5Q�6_   ._�5      �� .+�5      ��  �� Orientation$ Vertical=�6   $��Center=�64   $��0,0,0,30q�6Q   .+�5      �� $��Film Database��6    $��20(�5      $
��Bold"�6-   $��Center=�5      ���#3335      �� 5      $��Management App��6    $��20(�5      $
��Bold"�6-   $��Center=�5      ���#3335      5      �� 5      $��Email:��6   $��SemiBold"�6*   $��0,0,0,8q�6@   $��14(�6Q   �� 5       $��12q�5!      $��45��6'   $��16(�63   $��0,0,0,20q�6A   ��5       �� *Email+ �� UpdateSourceTrigger$ PropertyChanged=�5!   A   �� 5#      $��	Password:��6   $��SemiBold"�6-   $��0,0,0,8q�6C   $��14(�6T   � 5$      $��0,0,0,15q�6    � ColumnDefinitions 5%      �� 5&      $��* �6+   �� 5'      $
��Auto �6+   .+�5*      G� -   5         G�Name$ PasswordBox��5*   "   $��0��5+   !   $��12,12,40,12q�5,   !   $��45��67   $��16(�6C   y�5.   !   �� *IsPasswordVisible+ '  #InverseBooleanToVisibilityConverter �� 	Converter# [  �� 50      -   5         ��Name$ PasswordTextBox��50      $��0��51      $��12,12,40,12q�53      $��45��63   $��16(�6?   ��52      �� *
Password+$ PropertyChanged=�y�54      �� *IsPasswordVisible+   BooleanToVisibilityConverter# [ �� 56      -   5         ��Name$ TogglePasswordButton��56      $��0��57      $��Right=�58      $��Center=�59      $��0,0,10,0q�5:      $��30��5;      $��30��6'   
������ $��0q�5=       � Cursor$
 Hand��5?      .��5@      �� $��Segoe MDL2 Assets)�5A   #   $��16(�5B   #   ���#666��5@   $   �� *IsPasswordVisible+ # PasswordVisibilityIconConverter# [ 5C   #   5D      5E      �� 5G      
���  ��$��0,10,0,0q�5I      $
��Wrap=�5K      ��5G      �� *ErrorMessage+y�5J      �� *ErrorMessage+  StringToVisibilityConverter# [ 5K      �� 5M      $��Login��6   $��50��5O      $��0,25,0,0q�5P      ���#007acc
�������$��0q�5S      $��18(�5T      $��SemiBold"�5U      ��5N      �� *LoginCommand+{�5V      �� *	IsLoading+  InverseBooleanConverter# [ ��5W      �� 5X       �� 
TargetType" ��6    .�5Y      ��  �� Property � �� �� Value 5Z   "   �� 5[   &    �� 
TargetType" ��66   .R�5\   *   �� #��z��61   $ 5��5]   0   #��z��5^   0   #��z��5_   0   ._�5`   .   �� $��Center=�6?   $��Center=�5a   =   5b   +    �� Triggers 5c   *   P� 5d   .    P� Property �@J�IsMouseOver P� Value$
 True��6M   . �5e   2   ��  � �� �#0059996O   5f   /   5h   '   5j      5k      5m      � 5o      $��4��5p      $��0,10,0,0q�5q       � IsIndeterminate 5o      �� *	IsLoading+y�5r      �� *	IsLoading+# [ 5s      5t      5u      5v      
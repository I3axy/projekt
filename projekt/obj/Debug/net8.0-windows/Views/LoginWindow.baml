   M S B A M L   `   `   `  ����  projekt    projekt.Views.LoginWindow   5   	   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	     � Title$  Film Management - Login��5   	   $	��500��6)   $	��450��66    � WindowStartupLocation$ CenterScreen=�5   	    � 
ResizeMode$ NoResize=�5   	   .��5      � ���#f5f5f5 � RowDefinitions 5   
   �� 5	      $��* �6   �� 5
      $
��Auto �6   �� 5      $��* �6   .+�5   
   �� $��1��6   
������� �� CornerRadius$ 10��61   $��30q�5       �� Padding$ 40q�6    J� Effect 5      3  -System.Windows.Media.Effects.DropShadowEffect  5         Color$
 Gray��6#      	Direction$	 320Q�60   	   ShadowDepth$	 3Q�6@   
   
BlurRadius$
 5Q�6P      Opacity$	 0.5Q�6_   ._�5      �� .+�5      �� $��Film Management System��6   $��20(�5      $
��Bold"�6)   $��Center=�5      $��0,0,0,30q�5      ���#3335      �� 5      $��Email:��6   $��SemiBold"�6*   $��0,0,0,8q�6@   $��14(�6Q   �� 5      $��12q�5      $��45��6'   $��16(�63   $��0,0,0,20q�6A   ��5      �� *Email+ �� UpdateSourceTrigger$ PropertyChanged=�5   A   �� 5      $��	Password:��6   $��SemiBold"�6-   $��0,0,0,8q�6C   $��14(�6T   � 5      $��0,0,0,15q�6    � ColumnDefinitions 5       �� 5!      $��* �6+   �� 5"      $
��Auto �6+   .+�5%      G� -   5         G�Name$ PasswordBox��5%   "   $��0��5&   !   $��12,12,40,12q�5'   !   $��45��67   $��16(�6C   y�5)   !   �� *IsPasswordVisible+ '  #InverseBooleanToVisibilityConverter �� 	Converter# [  �� 5+      -   5         ��Name$ PasswordTextBox��5+      $��0��5,      $��12,12,40,12q�5.      $��45��63   $��16(�6?   ��5-      �� *
Password+$ PropertyChanged=�y�5/      �� *IsPasswordVisible+   BooleanToVisibilityConverter# [ �� 51      -   5         ��Name$ TogglePasswordButton��51      $��0��52      $��Right=�53      $��Center=�54      $��0,0,10,0q�55      $��30��56      $��30��6'   
������ $��0q�58       � Cursor$
 Hand��5:      .��5;      �� $��Segoe MDL2 Assets)�5<   #   $��16(�5=   #   ���#666��5;   $   �� *IsPasswordVisible+ # PasswordVisibilityIconConverter# [ 5>   #   5?      5@      �� 5B      
���  ��$��0,10,0,0q�5D      $
��Wrap=�5F      ��5B      �� *ErrorMessage+y�5E      �� *ErrorMessage+  StringToVisibilityConverter# [ 5F      �� 5H      $��Login��6   $��50��5J      $��0,25,0,0q�5K      ���#007acc
�������$��0q�5N      $��18(�5O      $��SemiBold"�5P      ��5I      �� *LoginCommand+{�5Q      �� *	IsLoading+  InverseBooleanConverter# [ ��5R      �� 5S       �� 
TargetType" ��6    .�5T      ��  �� Property � �� �� Value 5U   "   �� 5V   &    �� 
TargetType" ��66   .R�5W   *   �� #��z��61   $ 5��5X   0   #��z��5Y   0   #��z��5Z   0   ._�5[   .   �� $��Center=�6?   $��Center=�5\   =   5]   +    �� Triggers 5^   *   P� 5_   .    P� Property �@J�IsMouseOver P� Value$
 True��6M   . �5`   2   ��  � �� �#0059996O   5a   /   5c   '   5e      5f      5h      � 5j      $��4��5k      $��0,10,0,0q�5l       � IsIndeterminate 5j      �� *	IsLoading+y�5m      �� *	IsLoading+# [ 5n      5o      5p      5q      
   M S B A M L   `   `   `  ����   projekt    projekt.Views.LoginWindow   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml       � Title$  Film Management - Login��$	��500��$	��450�� � WindowStartupLocation$ CenterScreen=� � 
ResizeMode$ NoResize=�.��� ���#f5f5f5 � RowDefinitions �� $��* ��� $
��Auto ��� $��* �.+��� $��1��
������� �� CornerRadius$ 10��$��30q� �� Padding$ 40q� J� Effect 3  -System.Windows.Media.Effects.DropShadowEffect     Color$
 Gray��   	Direction$	 320Q�	   ShadowDepth$	 3Q�
   
BlurRadius$
 5Q�   Opacity$	 0.5Q�._��� .+��� $��Film Management System��$��20(�$
��Bold"�$��Center=�$��0,0,0,30q����#333�� $��Email:��$��SemiBold"�$��0,0,0,8q�$��14(��� $��12q�$��45��$��16(�$��0,0,0,20q����� *Email+ �� UpdateSourceTrigger$ PropertyChanged=��� $��	Password:��$��SemiBold"�$��0,0,0,8q�$��14(�� $��0,0,0,15q� � ColumnDefinitions �� $��* ��� $
��Auto �.+�G� -    G�Name$ PasswordBox��$��0��$��12,12,40,12q�$��45��$��16(�y��� *IsPasswordVisible+ '  #InverseBooleanToVisibilityConverter �� 	Converter# [  �� -    ��Name$ PasswordTextBox��$��0��$��12,12,40,12q�$��45��$��16(����� *
Password+$ PropertyChanged=�y��� *IsPasswordVisible+   BooleanToVisibilityConverter# [ �� -    ��Name$ TogglePasswordButton��$��0��$��Right=�$��Center=�$��0,0,10,0q�$��30��$��30��
������ $��0q� � Cursor$
 Hand��.���� $��Segoe MDL2 Assets)�$��16(����#666���� *IsPasswordVisible+ # PasswordVisibilityIconConverter# [ �� 
���  ��$��0,10,0,0q�$
��Wrap=����� *ErrorMessage+y��� *ErrorMessage+  StringToVisibilityConverter# [ �� $��Login��$��50��$��0,25,0,0q����#007acc
�������$��0q�$��18(�$��SemiBold"����� *LoginCommand+{��� *	IsLoading+  InverseBooleanConverter# [ ����  �� 
TargetType" ��.���  �� Property � �� �� Value ��  �� 
TargetType" ��.R��� #��z��$ 5��#��z��#��z��._��� $��Center=�$��Center=� �� Triggers P�  P� Property �@J�IsMouseOver P� Value$
 True��. ���  � �� �#005999� $��4��$��0,10,0,0q� � IsIndeterminate �� *	IsLoading+y��� *	IsLoading+# [ 
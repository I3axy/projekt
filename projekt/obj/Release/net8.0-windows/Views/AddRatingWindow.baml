   M S B A M L   `   `   `  ����   projekt#    projekt.Views.AddRatingWindow   W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml       � Title$  
Add Rating��$	��400��$	��450�� � WindowStartupLocation$ CenterOwner=� � 
ResizeMode$ NoResize=�.��� $��20q� � RowDefinitions �� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $
��Auto ��� $��* ��� $
��Auto �.+��� $��0��$��Add New Rating��$��18(�$
��Bold"�$��0,0,0,20q����#2d3748�� $��1��$��Select User:��$��SemiBold"�$��0,0,0,5q��� -    ��Name$ UserComboBox��$��2��$��35��$��14(�$��0,0,0,20q� �� DisplayMemberPath$
 Name�� �� SelectedValuePath$ UserID��$��8q��� $��3��$��Rating:��$��SemiBold"�$��0,0,0,5q��� -    ��Name$ RatingSlider��$��4�� � Minimum$ 1Q�	 � Maximum$	 5Q�
 � Value$
 3Q� �� TickFrequency$ 1Q� �� TickPlacement$ BottomRight=� �� IsSnapToTickEnabled$
 True��$��0,0,0,10q��� $��5��$��Center=�$��16(�$��SemiBold"�$��0,0,0,20q��� $�Rating: �� �� ���  �� ElementName$ RatingSlider�� �� Path$ Value� �� StringFormat$ F0�� �� $
� / 5���� $��7�� �� Orientation$ 
Horizontal=�$��Right=�$��0,30,0,0q�.+��� -   $
��Save�����#38a169
�������$
��20,8q�$��0,0,10,0q�$��0q��� -   $��Cancel�����#a0aec0
�������$
��20,8q�$��0q�
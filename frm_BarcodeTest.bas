Version =21
VersionRequired =20
Begin Form
    DividingLines = NotDefault
    AllowDesignChanges = NotDefault
    DefaultView =0
    PictureAlignment =2
    DatasheetGridlinesBehavior =3
    GridY =10
    Width =13322
    DatasheetFontHeight =11
    ItemSuffix =12
    Right =19650
    Bottom =13695
    DatasheetGridlinesColor =15132391
    RecSrcDt = Begin
        0x37d7cd53da67e540
    End
    DatasheetFontName ="Calibri"
    PrtMip = Begin
        0x6801000068010000680100006801000000000000201c0000e010000001000000 ,
        0x010000006801000000000000a10700000100000001000000
    End
    FilterOnLoad =0
    ShowPageMargins =0
    DisplayOnSharePointSite =1
    DatasheetAlternateBackColor =15921906
    DatasheetGridlinesColor12 =0
    FitToScreen =1
    DatasheetBackThemeColorIndex =1
    BorderThemeColorIndex =3
    ThemeFontIndex =1
    ForeThemeColorIndex =0
    AlternateBackThemeColorIndex =1
    AlternateBackShade =95.0
    Begin
        Begin Label
            BackStyle =0
            FontSize =11
            FontName ="Calibri"
            ThemeFontIndex =1
            BackThemeColorIndex =1
            BorderThemeColorIndex =0
            BorderTint =50.0
            ForeThemeColorIndex =0
            ForeTint =50.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin TextBox
            AddColon = NotDefault
            FELineBreak = NotDefault
            BorderLineStyle =0
            Width =1701
            LabelX =-1701
            FontSize =11
            FontName ="Calibri"
            AsianLineBreak =1
            BackThemeColorIndex =1
            BorderThemeColorIndex =1
            BorderShade =65.0
            ThemeFontIndex =1
            ForeThemeColorIndex =0
            ForeTint =75.0
            GridlineThemeColorIndex =1
            GridlineShade =65.0
        End
        Begin Section
            Height =9524
            Name ="Detail"
            AlternateBackColor =15921906
            AlternateBackThemeColorIndex =1
            AlternateBackShade =95.0
            BackThemeColorIndex =1
            Begin
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =3061
                    Top =850
                    Width =3061
                    Height =1125
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Text0"
                    GridlineColor =10921638

                    LayoutCachedLeft =3061
                    LayoutCachedTop =850
                    LayoutCachedWidth =6122
                    LayoutCachedHeight =1975
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =1474
                            Top =850
                            Width =585
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Label1"
                            Caption ="Text0"
                            GridlineColor =10921638
                            LayoutCachedLeft =1474
                            LayoutCachedTop =850
                            LayoutCachedWidth =2059
                            LayoutCachedHeight =1165
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    TextFontFamily =2
                    IMESentenceMode =3
                    Left =3061
                    Top =2948
                    Width =9301
                    Height =1125
                    FontSize =48
                    TabIndex =1
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Text2"
                    ControlSource ="=barcode128A([text0])"
                    FontName ="Code 128"
                    GridlineColor =10921638

                    LayoutCachedLeft =3061
                    LayoutCachedTop =2948
                    LayoutCachedWidth =12362
                    LayoutCachedHeight =4073
                    ThemeFontIndex =-1
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =1474
                            Top =2948
                            Width =1425
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Label3"
                            Caption ="barcode128A()"
                            GridlineColor =10921638
                            LayoutCachedLeft =1474
                            LayoutCachedTop =2948
                            LayoutCachedWidth =2899
                            LayoutCachedHeight =3263
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =3061
                    Top =4193
                    Width =9301
                    Height =1125
                    TabIndex =2
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Text4"
                    ControlSource ="=debugString([text2])"
                    GridlineColor =10921638

                    LayoutCachedLeft =3061
                    LayoutCachedTop =4193
                    LayoutCachedWidth =12362
                    LayoutCachedHeight =5318
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =1474
                            Top =4193
                            Width =585
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Label5"
                            Caption ="Text0"
                            GridlineColor =10921638
                            LayoutCachedLeft =1474
                            LayoutCachedTop =4193
                            LayoutCachedWidth =2059
                            LayoutCachedHeight =4508
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =215
                    TextFontFamily =2
                    IMESentenceMode =3
                    Left =3061
                    Top =5952
                    Width =9301
                    Height =1125
                    FontSize =48
                    TabIndex =3
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Text8"
                    ControlSource ="=barcode128Auto([text0])"
                    FontName ="Code 128"
                    GridlineColor =10921638

                    LayoutCachedLeft =3061
                    LayoutCachedTop =5952
                    LayoutCachedWidth =12362
                    LayoutCachedHeight =7077
                    ThemeFontIndex =-1
                    Begin
                        Begin Label
                            OverlapFlags =93
                            Left =1360
                            Top =5952
                            Width =1740
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Label9"
                            Caption ="barcode128Auto()"
                            GridlineColor =10921638
                            LayoutCachedLeft =1360
                            LayoutCachedTop =5952
                            LayoutCachedWidth =3100
                            LayoutCachedHeight =6267
                        End
                    End
                End
                Begin TextBox
                    OverlapFlags =85
                    IMESentenceMode =3
                    Left =3061
                    Top =7197
                    Width =9301
                    Height =1125
                    TabIndex =4
                    BorderColor =10921638
                    ForeColor =4210752
                    Name ="Text10"
                    ControlSource ="=debugString([text8])"
                    GridlineColor =10921638

                    LayoutCachedLeft =3061
                    LayoutCachedTop =7197
                    LayoutCachedWidth =12362
                    LayoutCachedHeight =8322
                    Begin
                        Begin Label
                            OverlapFlags =85
                            Left =1474
                            Top =7197
                            Width =585
                            Height =315
                            BorderColor =8355711
                            ForeColor =8355711
                            Name ="Label11"
                            Caption ="Text0"
                            GridlineColor =10921638
                            LayoutCachedLeft =1474
                            LayoutCachedTop =7197
                            LayoutCachedWidth =2059
                            LayoutCachedHeight =7512
                        End
                    End
                End
            End
        End
    End
End

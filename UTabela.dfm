џ
 TFTABELA 0Ш  TPF0TfTabelafTabelaLefthTopQBorderIcons BorderStylebsDialogCaptionfTabelaClientHeightBClientWidthћColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Heightѕ	Font.NameMS Sans Serif
Font.Style 
KeyPreview	OldCreateOrderPositionpoMainFormCenterOnClose	FormCloseOnCreate
FormCreate	OnKeyDownFormKeyDownOnShowFormShowPixelsPerInch`
TextHeight TDBGridDBGridLeft Top WidthћHeight"AlignalClientColor№ћџ 
DataSourceDataSource1Font.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Heightї	Font.NameArial
Font.Style OptionsdgTitlesdgIndicatordgColumnResize
dgColLines
dgRowLinesdgTabsdgRowSelectdgAlwaysShowSelectiondgConfirmDeletedgCancelOnExit 
ParentFontTabOrder TitleFont.CharsetANSI_CHARSETTitleFont.ColorclWindowTextTitleFont.HeightѕTitleFont.NameArialTitleFont.Style 
OnDblClickDBGridDblClickColumnsExpandedWidthsVisible	 ExpandedWidthsVisible	 ExpandedWidthsVisible	 ExpandedWidthsVisible	    TPanelPanel1Left Top"WidthћHeight AlignalBottomTabOrder TSpeedButtonbtMostraItemsLeftTopWidth]HeightCaptionF9 - Mostra ItemsFlat	OnClickbtMostraItemsClick  TBitBtnBt_SairLeft TopWidthaHeightCancel	Caption&SairDoubleBuffered	
Glyph.Data
:  6  BM6      6  (                            ЕZ  НZ  ЦZ  Юc  Юk  жk  жs  оs  о{  ч{  я{  ї{     ї  џ     о{ ї ­Z R ч{ о Ѕ ­ ­ оs) !­1 Н1 !Н1 J9 )Н9 BBB )ЦJ 1ЦJ cc Bжk  џчЦ џяж џїж џїо џ џ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ џџџ )))))))))))))))))))))))))))))" """""")))"   ")))"!")))"! #")))"!#")))"(")))"%%%%%")))"&&&&&")))"			
'((((")))"


'''''")))"'''''"))))""$$$$$$))))))"""))))))))))))))))))))))))ParentDoubleBufferedTabOrder TabStopOnClickBt_SairClick   TDataSourceDataSource1DataSetIBEstaTabelaLeftXTop   	TIBOQueryIBEstaTabelaParams DatabaseNameF:\Fontes\Focus\FOCUS.FOCEditSQL.Strings     IB_TransactionTREstaTabelaRecordCountAccurate	SQL.StringsselectNF.DT_ENTRADA,PF.COD_PROD_FORNEC,F.NM_FORNECEDOR,F.CD_FORNECEDOR,NI.CD_PRODUTO,1(NI.QUANTIDADE * NI.UNDCONVERSAO) as QUANTIDADE, -(NI.VALORUNITARIO / NI.UNDCONVERSAO) as VALOR    from NF_ITEMS NI-left outer join NF on NI.CD_NOTA = NF.CD_NOTADleft outer join FORNECEDORES F on F.CD_FORNECEDOR = NF.CD_FORNECEDORhleft outer join PRODFORNEC PF on (NI.CD_PRODUTO = PF.CD_PRODUTO and NF.CD_FORNECEDOR = PF.CD_FORNECEDOR)        order by 1 desc FieldOptions LeftHTopd  TIBOTransactionTREstaTabela	IsolationtiCommittedLefthTopd   
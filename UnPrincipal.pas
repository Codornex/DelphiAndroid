unit UnPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl,
  FMX.Layouts, System.Actions, FMX.ActnList, FMX.Controls.Presentation,
  FMX.StdCtrls, FMX.Objects, FMX.Effects;

type
  TfrmPrincipal = class(TForm)
    tbItemMenu: TTabItem;
    tbItemApoio: TTabItem;
    tbctrlPrincipal: TTabControl;
    lytPrincipal: TLayout;
    Layout1: TLayout;
    actAcoes: TActionList;
    actMudarAba: TChangeTabAction;
    lytMenu: TGridLayout;
    lytSuperior: TLayout;
    lytInferior: TLayout;
    lytBotao1: TLayout;
    rndBotao1: TRoundRect;
    imgBotao1: TImage;
    lytRotulo1: TLayout;
    lblTituloBtn1: TLabel;
    lblDescricaoBtn1: TLabel;
    ShadowEffect1: TShadowEffect;
    Layout2: TLayout;
    RoundRect1: TRoundRect;
    imgCadForn: TImage;
    Layout3: TLayout;
    lblTituloBtn2: TLabel;
    ShadowEffect2: TShadowEffect;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure imgBotao1Click(Sender: TObject);
  private
    { Private declarations }
    FActiveForm : TForm;
  public
    { Public declarations }
    procedure MudarAba(ATabItem: TTabItem; Sender: TObject);
    procedure AbrirForm(AFormClass: TComponentClass);
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

procedure TfrmPrincipal.AbrirForm(AFormClass: TComponentClass);
var
  LayoutBase, BotaoMenu: TComponent;
begin
  if Assigned(FActiveForm) then
  begin
    if FActiveForm.ClassType = AFormClass then
      exit
    else
    begin
      FActiveForm.DisposeOf; //Não usar Free
      //Free passa pelo GarbageCollector isso pode demorar DisponseOf Limpa direto
      FActiveForm := nil;
    end;
  end;

  Application.CreateForm(AFormClass, FActiveForm);

  //encontra o LayoutBase no form a ser exibido para adicionar ao FrmPrincipal
  LayoutBase := FActiveForm.FindComponent('lytBase');
  if Assigned(LayoutBase) then
    lytPrincipal.AddObject(TLayout(LayoutBase));

  //enccontra o Botão de controle de Menu no form a ser exibido para
  //associá-lo ao Multiview do frmPrincipal
  //Caso tenha menu....modelo abaixo:
  //BotaoMenu := FActiveForm.FindComponent('btnMenu');
  //if Assigned(BotaoMenu) then
  //  mlvMenu.MasterButton := TControl(BotaoMenu);
end;

procedure TfrmPrincipal.Button1Click(Sender: TObject);
begin
  MudarAba(tbItemApoio);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  tbctrlPrincipal.ActiveTab := tbItemMenu;
  tbctrlPrincipal.TabPosition := TTabPosition.None; //Para as TABs nao aparecer na execucao
end;

procedure TfrmPrincipal.imgBotao1Click(Sender: TObject);
begin
  //AbrirForm(TfrmClientes);   //Carrego o próximo form
  //MudarAba(tbItemApoio, Sender);  //Mudar aba do menu para o apoio
end;

procedure TfrmPrincipal.MudarAba(ATabItem: TTabItem; Sender: TObject);
begin
  actMudarAba.Tab := ATabItem;
  actMudarAba.ExecuteTarget(Sender);
end;

end.

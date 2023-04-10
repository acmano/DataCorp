use DataCorp
go

create schema geo
go

CREATE OR ALTER PROCEDURE geo.continente
(
  @mundoNome            VARCHAR(64)
, @continenteNome       VARCHAR(64)
, @continenteDescricao  VARCHAR(128)
, @nacaoNumero          INTEGER
)
AS
BEGIN
  exec geo.continenteInclui @continenteNome, @continenteDescricao
  exec geo.continenteMundoInclui @mundoNome, @continenteNome
  exec geo.nacaoInclui @nacaoNumero
  exec geo.nacaoContinenteInclui @continenteNome, @nacaoNumero
END
GO

CREATE OR ALTER PROCEDURE geo.regiao
(
  @continenteNome       VARCHAR(64)
, @regiaoNome           VARCHAR(64)
, @regiaoDescricao      VARCHAR(128)
, @nacaoNumero          INTEGER
)
AS
BEGIN
  exec geo.regiaoInclui @regiaoNome, @regiaoDescricao
  exec geo.regiaoContinenteInclui @continenteNome,  @regiaoNome
  exec geo.nacaoInclui @nacaoNumero
  exec geo.nacaoRegiaoInclui @regiaoNome, @nacaoNumero
END
GO

CREATE OR ALTER PROCEDURE geo.subRegiao
(
  @regiaoNome           VARCHAR(64)
, @subRegiaoNome        VARCHAR(64)
, @subRegiaoDescricao   VARCHAR(128)
, @nacaoNumero          INTEGER
)
AS
BEGIN
  exec geo.subRegiaoInclui @subRegiaoNome, @subRegiaoDescricao
  exec geo.subRegiaoRegiaoInclui @regiaoNome,  @subRegiaoNome
  exec geo.nacaoInclui @nacaoNumero
  exec geo.nacaoSubRegiaoInclui @subRegiaoNome, @nacaoNumero
END
GO

CREATE OR ALTER PROCEDURE geo.paisRegiao
(
  @regiaoNome           VARCHAR(64)
, @paisNome             VARCHAR(64)
, @paisDescricao        VARCHAR(128)
, @nacaoNumero          INTEGER
)
AS
BEGIN
  exec geo.paisInclui @paisNome, @paisDescricao
  exec geo.paisRegiaoInclui @regiaoNome, @paisNome
  exec geo.nacaoInclui @nacaoNumero
  exec geo.nacaoPaisInclui @paisNome, @nacaoNumero
END
GO

CREATE OR ALTER PROCEDURE geo.paisSubRegiao
(
  @subRegiaoNome        VARCHAR(64)
, @paisNome             VARCHAR(64)
, @paisDescricao        VARCHAR(128)
, @nacaoNumero          INTEGER
)
AS
BEGIN
  exec geo.paisInclui @paisNome, @paisDescricao
  exec geo.paisSubRegiaoInclui @subRegiaoNome, @paisNome
  exec geo.nacaoInclui @nacaoNumero
  exec geo.nacaoPaisInclui @paisNome, @nacaoNumero
END
GO

--  Terra
exec geo.mundoInclui 'Terra', 'Lar da Humanidade'
exec geo.nacaoInclui 1
exec geo.nacaoMundoInclui 'Terra', 1

exec geo.continente    'Terra', '�frica', 'Continente Africano', 2
exec geo.regiao        '�frica', '�frica do Norte', '', 15
exec geo.paisRegiao    '�frica do Norte', 'Arg�lia', 'Rep�blica Argelina Democr�tica e Popular da Arg�lia', 12
exec geo.paisRegiao    '�frica do Norte', 'Egito', 'Rep�blica �rabe do Egito', 818
exec geo.paisRegiao    '�frica do Norte', 'L�bia', 'Estado da L�bia', 434
exec geo.paisRegiao    '�frica do Norte', 'Marrocos', 'Reino de Marrocos', 504
exec geo.paisRegiao    '�frica do Norte', 'Sud�o', 'Rep�blica do Sud�o', 729
exec geo.paisRegiao    '�frica do Norte', 'Tun�sia', 'Rep�blica Tunisiana', 788
exec geo.paisRegiao    '�frica do Norte', 'Saara Ocidental', 'Rep�blica �rabe Saariana Democr�tica', 732

exec geo.regiao        '�frica', '�frica Sub Saariana', '', 202
exec geo.subRegiao     '�frica Sub Saariana', '�frica Oriental', '', 14
exec geo.paisSubRegiao '�frica Oriental', 'Territ�rio Brit�nico do Oceano �ndico', 'Territ�rio Brit�nico do Oceano �ndico', 86
exec geo.paisSubRegiao '�frica Oriental', 'Burundi', 'Rep�blica do Burundi', 108
exec geo.paisSubRegiao '�frica Oriental', 'Comores', 'Uni�o das Comores', 174
exec geo.paisSubRegiao '�frica Oriental', 'Djibuti', 'Rep�blica do Djibuti', 262
exec geo.paisSubRegiao '�frica Oriental', 'Eritreia', 'Estado da Eritreia', 232
exec geo.paisSubRegiao '�frica Oriental', 'Eti�pia', 'Rep�blica Democr�tica Federal da Eti�pia', 231
exec geo.paisSubRegiao '�frica Oriental', 'Territ�rios Franceses do Sul', 'Territ�rios Franceses do Sul', 260
exec geo.paisSubRegiao '�frica Oriental', 'Qu�nia', 'Rep�blica do Qu�nia', 404
exec geo.paisSubRegiao '�frica Oriental', 'Madagascar', 'Rep�blica de Madagascar', 450
exec geo.paisSubRegiao '�frica Oriental', 'Malau�', 'Rep�blica do Malau�', 454
exec geo.paisSubRegiao '�frica Oriental', 'Maur�cio', 'Rep�blica do Maur�cio', 480
exec geo.paisSubRegiao '�frica Oriental', 'Maiote', 'Departamento de Maiote', 175
exec geo.paisSubRegiao '�frica Oriental', 'Mo�ambique', 'Rep�blica de Mo�ambique', 508
exec geo.paisSubRegiao '�frica Oriental', 'Reuni�o', 'Departamento de Reuni�o', 638
exec geo.paisSubRegiao '�frica Oriental', 'Ruanda', 'Departamento de Ruanda', 646
exec geo.paisSubRegiao '�frica Oriental', 'Seicheles', 'Rep�blica das Seicheles', 690
exec geo.paisSubRegiao '�frica Oriental', 'Som�lia', 'Rep�blica Federal da Som�lia', 706
exec geo.paisSubRegiao '�frica Oriental', 'Sud�o do Sul', 'Rep�blica do Sud�o do Sul', 728
exec geo.paisSubRegiao '�frica Oriental', 'Uganda', 'Rep�blica de Uganda', 800
exec geo.paisSubRegiao '�frica Oriental', 'Tanz�nia', 'Rep�blica Unida da Tanz�nia', 834
exec geo.paisSubRegiao '�frica Oriental', 'Z�mbia', 'Rep�blica da Z�mbia', 894
exec geo.paisSubRegiao '�frica Oriental', 'Zimb�bue', 'Rep�blica do Zimb�bue', 716

exec geo.subRegiao     '�frica Sub Saariana', '�frica Central', '', 17
exec geo.paisSubRegiao '�frica Central', 'Angola', 'Rep�blica de Angola', 24
exec geo.paisSubRegiao '�frica Central', 'Camar�es', 'Rep�blica dos Camar�es', 120
exec geo.paisSubRegiao '�frica Central', 'Rep�blica Centro-Africana', 'Rep�blica Centro-Africana', 140
exec geo.paisSubRegiao '�frica Central', 'Chade', 'Rep�blica do Chade', 148
exec geo.paisSubRegiao '�frica Central', 'Congo', 'Rep�blica do Congo', 178
exec geo.paisSubRegiao '�frica Central', 'Rep�blica democr�tica do Congo', 'Rep�blica Democr�tica do Congo', 180
exec geo.paisSubRegiao '�frica Central', 'Guin� Equatorial', 'Rep�blica da Guin� Equatorial', 228
exec geo.paisSubRegiao '�frica Central', 'Gab�o', 'Rep�blica Gabonesa', 266
exec geo.paisSubRegiao '�frica Central', 'S�o Tom� e Pr�ncipe', 'Rep�blica Democr�tica de S�o Tom� e Pr�ncipe', 678

exec geo.subRegiao     '�frica Sub Saariana', '�frica do Sul', '', 18
exec geo.paisSubRegiao '�frica do Sul', 'Botsuana', 'Rep�blica do Botsuana', 72
exec geo.paisSubRegiao '�frica do Sul', 'Essuat�ni', 'Reino de Essuat�ni', 748
exec geo.paisSubRegiao '�frica do Sul', 'Lesoto', 'Reino do Lesoto', 426
exec geo.paisSubRegiao '�frica do Sul', 'Nam�bia', 'Rep�blica da Nam�bia', 516
exec geo.paisSubRegiao '�frica do Sul', '�frica do Sul', 'Rep�blica da �frica do Sul', 710

exec geo.subRegiao     '�frica Sub Saariana', '�frica Ocidental', '', 11
exec geo.paisSubRegiao '�frica Ocidental', 'Benim', 'Rep�blica do Benim', 204
exec geo.paisSubRegiao '�frica Ocidental', 'Burquina Fasso', 'Burquina Fasso', 854
exec geo.paisSubRegiao '�frica Ocidental', 'Cabo Verde', 'Rep�blica de Cabo Verde', 132
exec geo.paisSubRegiao '�frica Ocidental', 'Costa do Marfim', 'Rep�blica da Costa do Marfim', 384
exec geo.paisSubRegiao '�frica Ocidental', 'G�mbia', 'Rep�blica da G�mbia', 270
exec geo.paisSubRegiao '�frica Ocidental', 'Gana', 'Rep�blica do Gana', 288
exec geo.paisSubRegiao '�frica Ocidental', 'Guin�', 'Rep�blica da Guin�', 324
exec geo.paisSubRegiao '�frica Ocidental', 'Guin�-Bissau', 'Rep�blica da Guin�-Bissau', 624
exec geo.paisSubRegiao '�frica Ocidental', 'Lib�ria', 'Rep�blica da Lib�ria', 430
exec geo.paisSubRegiao '�frica Ocidental', 'Mali', 'Rep�blica do Mali', 466
exec geo.paisSubRegiao '�frica Ocidental', 'Maurit�nia', 'Rep�blica Isl�mica da Maurit�nia', 478
exec geo.paisSubRegiao '�frica Ocidental', 'N�ger', 'Rep�blica do N�ger', 562
exec geo.paisSubRegiao '�frica Ocidental', 'Nig�ria', 'Rep�blica Federal da Nig�ria', 566
exec geo.paisSubRegiao '�frica Ocidental', 'Santa Helena, Ascens�o e Trist�o da Cunha', 'Santa Helena, Ascens�o e Trist�o da Cunha', 654
exec geo.paisSubRegiao '�frica Ocidental', 'Senegal', 'Rep�blica do Senegal', 686
exec geo.paisSubRegiao '�frica Ocidental', 'Serra Leoa', 'Rep�blica da Serra Leoa', 694
exec geo.paisSubRegiao '�frica Ocidental', 'Togo', 'Rep�blica Togolesa', 768


exec geo.regiao        'Am�ricas', 'Am�rica Latina e Caribe', '', 419
exec geo.subRegiao     'Am�rica Latina e Caribe', 'Caribe', '', 29
exec geo.paisSubRegiao 'Caribe', 'Anguila', 'Anguila', 660
exec geo.paisSubRegiao 'Caribe', 'Antigua e Barbuda', 'Antigua e Barbuda', 28
exec geo.paisSubRegiao 'Caribe', 'Aruba', 'Aruba', 533
exec geo.paisSubRegiao 'Caribe', 'Bahamas', 'Comunidade das Bahamas', 44
exec geo.paisSubRegiao 'Caribe', 'Barbados', 'Barbados', 52
exec geo.paisSubRegiao 'Caribe', 'Bonaire, Saba e Santo Eust�quio', 'Bonaire, Saba e Santo Eust�quio', 535
exec geo.paisSubRegiao 'Caribe', 'Ilhas Virgens Brit�nicas', 'Ilhas Virgens Brit�nicas', 92
exec geo.paisSubRegiao 'Caribe', 'Ilhas Caim�', 'Ilhas Caim�', 136
exec geo.paisSubRegiao 'Caribe', 'Cuba', 'Rep�blica de Cuba', 192
exec geo.paisSubRegiao 'Caribe', 'Cura�ao', 'Cura�ao', 531
exec geo.paisSubRegiao 'Caribe', 'Dominica', 'Comunidade da Dominica', 212
exec geo.paisSubRegiao 'Caribe', 'Rep�blica Dominicana', 'Rep�blica Dominicana', 214
exec geo.paisSubRegiao 'Caribe', 'Granada', 'Granada', 308
exec geo.paisSubRegiao 'Caribe', 'Guadalupe', 'Guadalupe', 312
exec geo.paisSubRegiao 'Caribe', 'Haiti', 'Rep�blica do Haiti', 332
exec geo.paisSubRegiao 'Caribe', 'Jamaica', 'Jamaica', 388
exec geo.paisSubRegiao 'Caribe', 'Martinica', 'Martinica', 474
exec geo.paisSubRegiao 'Caribe', 'Montserrat', 'Montserrat', 500
exec geo.paisSubRegiao 'Caribe', 'Porto Rico', 'Porto Rico', 630
exec geo.paisSubRegiao 'Caribe', 'S�o Bartolomeu', 'Coletividade de S�o Bartolomeu', 652
exec geo.paisSubRegiao 'Caribe', 'S�o Crist�v�o e Neves', 'Federa��o de S�o Crist�v�o e Neves', 659
exec geo.paisSubRegiao 'Caribe', 'Santa L�cia', 'Santa L�cia', 662
exec geo.paisSubRegiao 'Caribe', 'S�o Martinho (Fran�a)', 'Coletividade de S�o Martinho (Fran�a)', 663
exec geo.paisSubRegiao 'Caribe', 'S�o Vicente e Granadinas', 'S�o Vicente e Granadinas', 670
exec geo.paisSubRegiao 'Caribe', 'S�o Martinho (Pa�ses Baixos)', 'S�o Martinho (Pa�ses Baixos)', 534
exec geo.paisSubRegiao 'Caribe', 'Trindade e Tobago', 'Rep�blica de Trindade e Tobago', 780
exec geo.paisSubRegiao 'Caribe', 'Ilhas Turcas e Caicos', 'Ilhas Turcas e Caicos', 796
exec geo.paisSubRegiao 'Caribe', 'Ilhas Virgens Americanas', 'Ilhas Virgens Americanas', 850

exec geo.subRegiao     'Am�rica Latina e Caribe', 'Am�rica Central', '', 13
exec geo.paisSubRegiao 'Am�rica Central', 'Belize', 'Belize', 84
exec geo.paisSubRegiao 'Am�rica Central', 'Costa Rica', 'Rep�blica da Costa Rica', 188
exec geo.paisSubRegiao 'Am�rica Central', 'El Salvador', 'Rep�blica de El Salvador', 222
exec geo.paisSubRegiao 'Am�rica Central', 'Guatemala', 'Rep�blica da Giatemala', 320
exec geo.paisSubRegiao 'Am�rica Central', 'Honduras', 'Rep�blica das Honduras', 340
exec geo.paisSubRegiao 'Am�rica Central', 'M�xico', 'Estados Unidos Mexicanos', 484
exec geo.paisSubRegiao 'Am�rica Central', 'Nicar�gua', 'Rep�blica da Nicar�gua', 558
exec geo.paisSubRegiao 'Am�rica Central', 'Panam�', 'Rep�blica do Panam�', 591

exec geo.subRegiao     'Am�rica Latina e Caribe', 'Am�rica do Sul', '', 5
exec geo.paisSubRegiao 'Am�rica do Sul', 'Argentina', 'Rep�blica Argentina', 32
exec geo.paisSubRegiao 'Am�rica do Sul', 'Bol�via', 'Estado Plurinacional da Bol�via', 68
exec geo.paisSubRegiao 'Am�rica do Sul', 'Ilha Bouvet', 'Ilha Bouvet', 74
exec geo.paisSubRegiao 'Am�rica do Sul', 'Brasil', 'Rep�blica Federativa do Brasil', 76
exec geo.paisSubRegiao 'Am�rica do Sul', 'Chile', 'Rep�blica do Chile', 152
exec geo.paisSubRegiao 'Am�rica do Sul', 'Col�mbia', 'Rep�blica da Col�mbia', 170
exec geo.paisSubRegiao 'Am�rica do Sul', 'Equador', 'Rep�blica do Equador', 218
exec geo.paisSubRegiao 'Am�rica do Sul', 'Ilhas Malvinas', 'Ilhas Malvinas', 238
exec geo.paisSubRegiao 'Am�rica do Sul', 'Guiana Francesa', 'Coletiviade Territorial da Guiana Francesa', 254
exec geo.paisSubRegiao 'Am�rica do Sul', 'Guiana', 'Rep�blica Colaborativa da Guiana', 328
exec geo.paisSubRegiao 'Am�rica do Sul', 'Paraguai', 'Rep�blica do Paraguai', 600
exec geo.paisSubRegiao 'Am�rica do Sul', 'Peru', 'Rep�blica do Peru', 604
exec geo.paisSubRegiao 'Am�rica do Sul', 'Ilhas Ge�rgia do Sul e Sandu�che do Sul', 'Ilhas Ge�rgia do Sul e Sandu�che do Sul', 239
exec geo.paisSubRegiao 'Am�rica do Sul', 'Suriname', 'Rep�blica do Suriname', 740
exec geo.paisSubRegiao 'Am�rica do Sul', 'Uruguai', 'Rep�blica Oriental do Uruguai', 858
exec geo.paisSubRegiao 'Am�rica do Sul', 'Venezuela', 'Rep�blica Bolivariana da Venezuela', 862

exec geo.continente    'Terra', 'Am�ricas', 'Continente Americano', 19
exec geo.regiao        'Am�ricas', 'Am�rica do Norte', '', 21
exec geo.paisRegiao    'Am�rica do Norte', 'Bermudas', 'Bermudas', 60
exec geo.paisRegiao    'Am�rica do Norte', 'Canad�', 'Canad�', 124
exec geo.paisRegiao    'Am�rica do Norte', 'Groenl�ndia ', 'Groenl�ndia ', 304
exec geo.paisRegiao    'Am�rica do Norte', 'S�o Pedro e Miquel�o', 'Coletividade de Ultramar de S�o Pedro e Miquel�o', 666
exec geo.paisRegiao    'Am�rica do Norte', 'Estados Unidos da Am�rica', 'Estados Unidos da Am�rica', 840



exec geo.continente    'Terra', 'Ant�rtica', 'Continente Ant�rtico', 10



exec geo.continente    'Terra', '�sia', 'Continente Asi�tico', 142
exec geo.regiao        '�sia', '�sia Central', '', 143
exec geo.paisRegiao    '�sia Central', 'Cazaquist�o', 'Rep�blica do Cazaquist�o', 398
exec geo.paisRegiao    '�sia Central', 'Quirguist�o', 'Rep�blica Quirguiz', 417
exec geo.paisRegiao    '�sia Central', 'Tajiquist�o', 'Rep�blica do Tajiquist�o', 762
exec geo.paisRegiao    '�sia Central', 'Turcomenist�o', 'Rep�blica do Turcomenist�o', 765
exec geo.paisRegiao    '�sia Central', 'Uzbequist�o', 'Rep�blica do Uzbequist�o', 860

exec geo.regiao        '�sia', '�sia Oriental', '', 30
exec geo.paisRegiao    '�sia Oriental', 'China', 'Rep�blica Popular da China', 156
exec geo.paisRegiao    '�sia Oriental', 'Hong Kong', 'Regi�o Administrativa Especial de Hong Kong', 344
exec geo.paisRegiao    '�sia Oriental', 'Macau', 'Regi�o Administrativa Especial de Macau', 446
exec geo.paisRegiao    '�sia Oriental', 'Cor�ia do Norte', 'Rep�blica Popular Democr�tica da Cor�ia', 408
exec geo.paisRegiao    '�sia Oriental', 'Jap�o', 'Jap�o', 392
exec geo.paisRegiao    '�sia Oriental', 'Mong�lia', 'Mongolia', 496
exec geo.paisRegiao    '�sia Oriental', 'Cor�ia do Sul', 'Rep�blica da Cor�ia', 410

exec geo.regiao        '�sia', 'Sudeste Asi�tico', '', 35
exec geo.paisRegiao    'Sudeste Asi�tico', 'Brunei', 'Estado de Brunei Darussalam', 96
exec geo.paisRegiao    'Sudeste Asi�tico', 'Camboja', 'Reino do Camboja', 116
exec geo.paisRegiao    'Sudeste Asi�tico', 'Indon�sia', 'Rep�blica da Indon�sia', 360
exec geo.paisRegiao    'Sudeste Asi�tico', 'Laos', 'Rep�blica Democr�tica Popular do Laos', 418
exec geo.paisRegiao    'Sudeste Asi�tico', 'Mal�sia', 'Mal�sia', 458
exec geo.paisRegiao    'Sudeste Asi�tico', 'Myanmar', 'Rep�blica da Uni�o de Myanmar', 104
exec geo.paisRegiao    'Sudeste Asi�tico', 'Filipinas', 'Rep�blica das Filipinas', 608
exec geo.paisRegiao    'Sudeste Asi�tico', 'Singapura', 'Rep�blica da Singapura', 702
exec geo.paisRegiao    'Sudeste Asi�tico', 'Tail�ndia', 'Reino da Tail�ndia', 764
exec geo.paisRegiao    'Sudeste Asi�tico', 'Timor-Leste', 'Rep�blica Democr�tica de Timor-Leste', 626
exec geo.paisRegiao    'Sudeste Asi�tico', 'Vietn�', 'Rep�blica Socialista do Vietn� ', 704

exec geo.regiao        '�sia', 'Sul da �sia', '', 34
exec geo.paisRegiao    'Sul da �sia', 'Afeganist�o', 'Emirado Isl�mico do Afeganist�o', 4
exec geo.paisRegiao    'Sul da �sia', 'Bangladesh', 'Rep�blica Popular do Bangladesh', 50
exec geo.paisRegiao    'Sul da �sia', 'But�o', 'Reino do But�o', 64
exec geo.paisRegiao    'Sul da �sia', '�ndia', 'Rep�blica da �ndia', 356
exec geo.paisRegiao    'Sul da �sia', 'Ir�', 'Rep�blica Isl�mica do Ir�', 364
exec geo.paisRegiao    'Sul da �sia', 'Maldivas', 'Rep�blica das Maldivas', 462
exec geo.paisRegiao    'Sul da �sia', 'Nepal', 'Rep�blica Democr�tica Federal do Nepal', 524
exec geo.paisRegiao    'Sul da �sia', 'Paquist�o', 'Rep�blica Isl�mica do Paquist�o', 586
exec geo.paisRegiao    'Sul da �sia', 'Sri Lanka', 'Rep�blica Democr�tica Socialista do Sri Lanka', 144

exec geo.regiao        '�sia', '�sia Ocidental', '', 145
exec geo.paisRegiao    '�sia Ocidental', 'Arm�nia', 'Rep�blica da Arm�nia', 51
exec geo.paisRegiao    '�sia Ocidental', 'Azerbaij�o', 'Rep�blica do Azerbaij�o', 31
exec geo.paisRegiao    '�sia Ocidental', 'Bahrein', 'Reino do Bahrein', 48
exec geo.paisRegiao    '�sia Ocidental', 'Chipre', 'Rep�blica do Chipre', 196
exec geo.paisRegiao    '�sia Ocidental', 'Ge�rgia', 'Ge�rgia', 268
exec geo.paisRegiao    '�sia Ocidental', 'Iraque', 'Rep�blica do Iraque', 368
exec geo.paisRegiao    '�sia Ocidental', 'Israel', 'Estado de Israel', 376
exec geo.paisRegiao    '�sia Ocidental', 'Jord�nia', 'Reino Haxemita da Jord�nia', 400
exec geo.paisRegiao    '�sia Ocidental', 'Kuwait', 'Estado do Kuwait', 414
exec geo.paisRegiao    '�sia Ocidental', 'L�bano', 'Rep�blica do L�bano', 422
exec geo.paisRegiao    '�sia Ocidental', 'Om�', 'Sultanato de Om�', 512
exec geo.paisRegiao    '�sia Ocidental', 'Catar', 'Estado do Catar', 634
exec geo.paisRegiao    '�sia Ocidental', 'Ar�bia Saudita', 'Reino da Ar�bia Saudita', 682
exec geo.paisRegiao    '�sia Ocidental', 'Palestina', 'Estado da Palestina', 275
exec geo.paisRegiao    '�sia Ocidental', 'S�ria', 'Rep�blica �rabe S�ria', 760
exec geo.paisRegiao    '�sia Ocidental', 'Turquia', 'Rep�blica da Turquia', 792
exec geo.paisRegiao    '�sia Ocidental', 'Emirados �rabes', 'Emirados �rabes Unidos', 784
exec geo.paisRegiao    '�sia Ocidental', 'I�men', 'Rep�blica do I�men', 887



exec geo.continente    'Terra', 'Europa', 'Continente Europeu', 150
exec geo.regiao        'Europa', 'Europa Oriental', '', 151
exec geo.paisRegiao    'Europa Oriental', 'Bielorr�ssia', 'Rep�blica da Bielorr�ssia', 112
exec geo.paisRegiao    'Europa Oriental', 'Bulg�ria', 'Rep�blica da Bulg�ria', 100
exec geo.paisRegiao    'Europa Oriental', 'Ch�quia', 'Rep�blica Checa', 203
exec geo.paisRegiao    'Europa Oriental', 'Hungria', 'Hungria', 348
exec geo.paisRegiao    'Europa Oriental', 'Pol�nia', 'Rep�blica da Pol�nia', 616
exec geo.paisRegiao    'Europa Oriental', 'Mold�via', 'Rep�blica da Moldova', 498
exec geo.paisRegiao    'Europa Oriental', 'Rom�nia', 'Rom�nia', 642
exec geo.paisRegiao    'Europa Oriental', 'R�ssia', 'Federa��o Russa', 643
exec geo.paisRegiao    'Europa Oriental', 'Eslov�quia', 'Rep�blica Eslovaca', 703
exec geo.paisRegiao    'Europa Oriental', 'Ucr�nia', 'Ucr�nia', 804

exec geo.regiao        'Europa', 'Norte da Europa', '', 154
exec geo.paisRegiao    'Norte da Europa', 'Ilhas Aland', 'Ilhas �land', 248
exec geo.subRegiao     'Norte da Europa', 'Ilhas do Canal', '', 830
exec geo.paisSubRegiao 'Ilhas do Canal', 'Guernsey', 'Bailiado de Guernsey', 831
exec geo.paisSubRegiao 'Ilhas do Canal', 'Jersey', 'Bailiado de Jersey', 832
exec geo.paisSubRegiao 'Ilhas do Canal', 'Sark', 'Sark', 680
exec geo.paisRegiao    'Norte da Europa', 'Dinamarca', 'Reino da Dinamarca', 208
exec geo.paisRegiao    'Norte da Europa', 'Est�nia', 'Rep�blica da Est�nia', 233
exec geo.paisRegiao    'Norte da Europa', 'Ilhas Feroe', 'Ilhas Feroe', 234
exec geo.paisRegiao    'Norte da Europa', 'Finl�ndia', 'Rep�blica da Finl�ndia', 246
exec geo.paisRegiao    'Norte da Europa', 'Isl�ndia', 'Isl�ndia', 352
exec geo.paisRegiao    'Norte da Europa', 'Irlanda', 'Rep�blica da Irlanda', 372
exec geo.paisRegiao    'Norte da Europa', 'Ilha de Man', 'Ilha de Man', 833
exec geo.paisRegiao    'Norte da Europa', 'Let�nia', 'Rep�blica da Let�nia', 428
exec geo.paisRegiao    'Norte da Europa', 'Litu�nia', 'Rep�blica da Litu�nia', 440
exec geo.paisRegiao    'Norte da Europa', 'Noruega', 'Rep�blica da Noruega', 578
exec geo.paisRegiao    'Norte da Europa', 'Jan Mayen', 'Jan Mayen', 744
exec geo.paisRegiao    'Norte da Europa', 'Su�cia', 'Reino da Su�cia', 752
exec geo.paisRegiao    'Norte da Europa', 'Reino Unido', 'Reino Unido da Gr�-Bretanha e Irlanda do Norte', 826

exec geo.regiao        'Europa', 'Sul da Europa', '', 39
exec geo.paisRegiao    'Sul da Europa', 'Alb�nia', 'Rep�blica da Alb�nia', 8
exec geo.paisRegiao    'Sul da Europa', 'Andorra', 'Principado de Andorra', 20
exec geo.paisRegiao    'Sul da Europa', 'B�snia e Herzegovina', 'B�snia e Herzegovina', 70
exec geo.paisRegiao    'Sul da Europa', 'Cro�cia', 'Rep�blica da Cro�cia', 191
exec geo.paisRegiao    'Sul da Europa', 'Gibraltar', 'Gibraltar', 292
exec geo.paisRegiao    'Sul da Europa', 'Gr�cia', 'Rep�blica Hel�nica', 300
exec geo.paisRegiao    'Sul da Europa', 'Vaticano', 'Estado da Cidade do Vaticano', 336
exec geo.paisRegiao    'Sul da Europa', 'It�lia', 'Rep�blica Italiana', 380
exec geo.paisRegiao    'Sul da Europa', 'Malta', 'Rep�blica de Malta', 470
exec geo.paisRegiao    'Sul da Europa', 'Montenegro', 'Montenegro', 499
exec geo.paisRegiao    'Sul da Europa', 'Maced�nia do Norte', 'Rep�blica da Maced�nia do Norte', 807
exec geo.paisRegiao    'Sul da Europa', 'Portugal', 'Rep�blica Portuguesa', 620
exec geo.paisRegiao    'Sul da Europa', 'Rep�blica de San Marino', 'Seren�ssima Rep�blica de San Marino', 674
exec geo.paisRegiao    'Sul da Europa', 'S�rvia', 'Rep�blica da S�rvia', 688
exec geo.paisRegiao    'Sul da Europa', 'Eslov�nia', 'Rep�blica da Eslov�nia', 705
exec geo.paisRegiao    'Sul da Europa', 'Espanha', 'Reino de Espanha', 724

exec geo.regiao        'Europa', 'Europa Ocidental', '', 155
exec geo.paisRegiao    'Europa Ocidental', '�ustria', 'Rep�blica da �ustria', 40
exec geo.paisRegiao    'Europa Ocidental', 'B�gica', 'Reino da B�lgica', 56
exec geo.paisRegiao    'Europa Ocidental', 'Fran�a', 'Rep�blica Francesa', 250
exec geo.paisRegiao    'Europa Ocidental', 'Alemanha', 'Rep�blica Federal da Alemanha', 276
exec geo.paisRegiao    'Europa Ocidental', 'Listenstaine', 'Principado do Listenstaine', 438
exec geo.paisRegiao    'Europa Ocidental', 'Luxemburgo', 'Gr�o-Ducado do Luxemburgo', 442
exec geo.paisRegiao    'Europa Ocidental', 'M�naco', 'Principado de M�naco', 492
exec geo.paisRegiao    'Europa Ocidental', 'Paises Baixos', 'Reino dos Paises Baixos', 528
exec geo.paisRegiao    'Europa Ocidental', 'Su�ca', 'Conffedera��o Su��a', 756



exec geo.continente    'Terra', 'Oceania', 'Continente Oce�nico', 9
exec geo.regiao        'Oceania', 'Austr�lia e Nova Zel�ndia', '', 53
exec geo.paisRegiao    'Austr�lia e Nova Zel�ndia', 'Austr�lia', 'Comunidade da Austr�lia', 36
exec geo.paisRegiao    'Austr�lia e Nova Zel�ndia', 'Ilha do Natal', 'Territ�rio da Ilha do Natal', 162
exec geo.paisRegiao    'Austr�lia e Nova Zel�ndia', 'Ilhas Cocos', 'Ilhas Cocos', 166
exec geo.paisRegiao    'Austr�lia e Nova Zel�ndia', 'Ilhas Heard e McDonald', 'Territ�rio das Ilhas Heard e McDonald', 334
exec geo.paisRegiao    'Austr�lia e Nova Zel�ndia', 'Nova Zel�ndia', 'Reino da Nova Zel�ndia', 554
exec geo.paisRegiao    'Austr�lia e Nova Zel�ndia', 'Ilha Norfolk', 'Ilha Norfolk', 574

exec geo.regiao        'Oceania', 'Melan�sia', '', 54
exec geo.paisRegiao    'Melan�sia', 'Fiji', 'Rep�blica das Fiji', 242
exec geo.paisRegiao    'Melan�sia', 'Nova Caled�nia', 'Nova Caled�nia', 540
exec geo.paisRegiao    'Melan�sia', 'Papua-Nova Guin�', 'Estado Independente da Papua-Nova Guin�', 598
exec geo.paisRegiao    'Melan�sia', 'Ilhas Salom�o', 'Ilhas Salom�o', 90
exec geo.paisRegiao    'Melan�sia', 'Vanuatu', 'Rep�blica de Vanuatu', 548

exec geo.regiao        'Oceania', 'Micron�sia', '', 57
exec geo.paisRegiao    'Micron�sia', 'Guam', 'Guam', 316
exec geo.paisRegiao    'Micron�sia', 'Kiribati', 'Rep�blica de Kiribati', 296
exec geo.paisRegiao    'Micron�sia', 'Ilhas Marshall', 'Rep�blica das Ilhas Marshall', 584
exec geo.paisRegiao    'Micron�sia', 'Micron�sia', 'Estados Federados da Micron�sia', 583
exec geo.paisRegiao    'Micron�sia', 'Nauru', 'Rep�blica de Nauru', 520
exec geo.paisRegiao    'Micron�sia', 'Ilhas Marianas do Norte', 'Comunidade das Ilhas Marianas Setentrionais', 580
exec geo.paisRegiao    'Micron�sia', 'Palau', 'Rep�blica de Palau', 585
exec geo.paisRegiao    'Micron�sia', 'Ilhas Menores Distantes dos Estados Unidos', 'Ilhas Menores Distantes dos Estados Unidos', 581

exec geo.regiao        'Oceania', 'Polin�sia', '', 61
exec geo.paisRegiao    'Polin�sia', 'Samoa Americana', 'Samoa Americana', 16
exec geo.paisRegiao    'Polin�sia', 'Ilhas Cook', 'Ilhas Cook', 184
exec geo.paisRegiao    'Polin�sia', 'Polin�sia Francesa', 'Polin�sia Francesa', 258
exec geo.paisRegiao    'Polin�sia', 'Niu�', 'Niu�', 570
exec geo.paisRegiao    'Polin�sia', 'Ilhas Pic�rnia', 'Ilhas Pic�rnia', 612
exec geo.paisRegiao    'Polin�sia', 'Samoa', 'Estado Independente da Samoa', 882
exec geo.paisRegiao    'Polin�sia', 'Toquelau', 'Toquelau', 772
exec geo.paisRegiao    'Polin�sia', 'Tonga', 'Reino de Tonga', 776
exec geo.paisRegiao    'Polin�sia', 'Tuvalu', 'Tuvalu', 798
exec geo.paisRegiao    'Polin�sia', 'Wallis e Futuna', 'Territ�rio das Ilhas Wallis e Futuna', 876
 
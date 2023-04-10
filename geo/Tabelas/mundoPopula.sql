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

exec geo.continente    'Terra', 'África', 'Continente Africano', 2
exec geo.regiao        'África', 'África do Norte', '', 15
exec geo.paisRegiao    'África do Norte', 'Argélia', 'República Argelina Democrática e Popular da Argélia', 12
exec geo.paisRegiao    'África do Norte', 'Egito', 'República Árabe do Egito', 818
exec geo.paisRegiao    'África do Norte', 'Líbia', 'Estado da Líbia', 434
exec geo.paisRegiao    'África do Norte', 'Marrocos', 'Reino de Marrocos', 504
exec geo.paisRegiao    'África do Norte', 'Sudão', 'República do Sudão', 729
exec geo.paisRegiao    'África do Norte', 'Tunísia', 'República Tunisiana', 788
exec geo.paisRegiao    'África do Norte', 'Saara Ocidental', 'República Árabe Saariana Democrática', 732

exec geo.regiao        'África', 'África Sub Saariana', '', 202
exec geo.subRegiao     'África Sub Saariana', 'África Oriental', '', 14
exec geo.paisSubRegiao 'África Oriental', 'Território Britânico do Oceano Índico', 'Território Britânico do Oceano Índico', 86
exec geo.paisSubRegiao 'África Oriental', 'Burundi', 'República do Burundi', 108
exec geo.paisSubRegiao 'África Oriental', 'Comores', 'União das Comores', 174
exec geo.paisSubRegiao 'África Oriental', 'Djibuti', 'República do Djibuti', 262
exec geo.paisSubRegiao 'África Oriental', 'Eritreia', 'Estado da Eritreia', 232
exec geo.paisSubRegiao 'África Oriental', 'Etiópia', 'República Democrática Federal da Etiópia', 231
exec geo.paisSubRegiao 'África Oriental', 'Territórios Franceses do Sul', 'Territórios Franceses do Sul', 260
exec geo.paisSubRegiao 'África Oriental', 'Quênia', 'República do Quênia', 404
exec geo.paisSubRegiao 'África Oriental', 'Madagascar', 'República de Madagascar', 450
exec geo.paisSubRegiao 'África Oriental', 'Malauí', 'República do Malauí', 454
exec geo.paisSubRegiao 'África Oriental', 'Maurício', 'República do Maurício', 480
exec geo.paisSubRegiao 'África Oriental', 'Maiote', 'Departamento de Maiote', 175
exec geo.paisSubRegiao 'África Oriental', 'Moçambique', 'República de Moçambique', 508
exec geo.paisSubRegiao 'África Oriental', 'Reunião', 'Departamento de Reunião', 638
exec geo.paisSubRegiao 'África Oriental', 'Ruanda', 'Departamento de Ruanda', 646
exec geo.paisSubRegiao 'África Oriental', 'Seicheles', 'República das Seicheles', 690
exec geo.paisSubRegiao 'África Oriental', 'Somália', 'República Federal da Somália', 706
exec geo.paisSubRegiao 'África Oriental', 'Sudão do Sul', 'República do Sudão do Sul', 728
exec geo.paisSubRegiao 'África Oriental', 'Uganda', 'República de Uganda', 800
exec geo.paisSubRegiao 'África Oriental', 'Tanzânia', 'República Unida da Tanzânia', 834
exec geo.paisSubRegiao 'África Oriental', 'Zâmbia', 'República da Zâmbia', 894
exec geo.paisSubRegiao 'África Oriental', 'Zimbábue', 'República do Zimbábue', 716

exec geo.subRegiao     'África Sub Saariana', 'África Central', '', 17
exec geo.paisSubRegiao 'África Central', 'Angola', 'República de Angola', 24
exec geo.paisSubRegiao 'África Central', 'Camarões', 'República dos Camarões', 120
exec geo.paisSubRegiao 'África Central', 'República Centro-Africana', 'República Centro-Africana', 140
exec geo.paisSubRegiao 'África Central', 'Chade', 'República do Chade', 148
exec geo.paisSubRegiao 'África Central', 'Congo', 'República do Congo', 178
exec geo.paisSubRegiao 'África Central', 'República democrática do Congo', 'República Democrática do Congo', 180
exec geo.paisSubRegiao 'África Central', 'Guiné Equatorial', 'República da Guiné Equatorial', 228
exec geo.paisSubRegiao 'África Central', 'Gabão', 'República Gabonesa', 266
exec geo.paisSubRegiao 'África Central', 'São Tomé e Príncipe', 'República Democrática de São Tomé e Príncipe', 678

exec geo.subRegiao     'África Sub Saariana', 'África do Sul', '', 18
exec geo.paisSubRegiao 'África do Sul', 'Botsuana', 'República do Botsuana', 72
exec geo.paisSubRegiao 'África do Sul', 'Essuatíni', 'Reino de Essuatíni', 748
exec geo.paisSubRegiao 'África do Sul', 'Lesoto', 'Reino do Lesoto', 426
exec geo.paisSubRegiao 'África do Sul', 'Namíbia', 'República da Namíbia', 516
exec geo.paisSubRegiao 'África do Sul', 'África do Sul', 'República da África do Sul', 710

exec geo.subRegiao     'África Sub Saariana', 'África Ocidental', '', 11
exec geo.paisSubRegiao 'África Ocidental', 'Benim', 'República do Benim', 204
exec geo.paisSubRegiao 'África Ocidental', 'Burquina Fasso', 'Burquina Fasso', 854
exec geo.paisSubRegiao 'África Ocidental', 'Cabo Verde', 'República de Cabo Verde', 132
exec geo.paisSubRegiao 'África Ocidental', 'Costa do Marfim', 'República da Costa do Marfim', 384
exec geo.paisSubRegiao 'África Ocidental', 'Gâmbia', 'República da Gâmbia', 270
exec geo.paisSubRegiao 'África Ocidental', 'Gana', 'República do Gana', 288
exec geo.paisSubRegiao 'África Ocidental', 'Guiné', 'República da Guiné', 324
exec geo.paisSubRegiao 'África Ocidental', 'Guiné-Bissau', 'República da Guiné-Bissau', 624
exec geo.paisSubRegiao 'África Ocidental', 'Libéria', 'República da Libéria', 430
exec geo.paisSubRegiao 'África Ocidental', 'Mali', 'República do Mali', 466
exec geo.paisSubRegiao 'África Ocidental', 'Mauritânia', 'República Islâmica da Mauritânia', 478
exec geo.paisSubRegiao 'África Ocidental', 'Níger', 'República do Níger', 562
exec geo.paisSubRegiao 'África Ocidental', 'Nigéria', 'República Federal da Nigéria', 566
exec geo.paisSubRegiao 'África Ocidental', 'Santa Helena, Ascensão e Tristão da Cunha', 'Santa Helena, Ascensão e Tristão da Cunha', 654
exec geo.paisSubRegiao 'África Ocidental', 'Senegal', 'República do Senegal', 686
exec geo.paisSubRegiao 'África Ocidental', 'Serra Leoa', 'República da Serra Leoa', 694
exec geo.paisSubRegiao 'África Ocidental', 'Togo', 'República Togolesa', 768


exec geo.regiao        'Américas', 'América Latina e Caribe', '', 419
exec geo.subRegiao     'América Latina e Caribe', 'Caribe', '', 29
exec geo.paisSubRegiao 'Caribe', 'Anguila', 'Anguila', 660
exec geo.paisSubRegiao 'Caribe', 'Antigua e Barbuda', 'Antigua e Barbuda', 28
exec geo.paisSubRegiao 'Caribe', 'Aruba', 'Aruba', 533
exec geo.paisSubRegiao 'Caribe', 'Bahamas', 'Comunidade das Bahamas', 44
exec geo.paisSubRegiao 'Caribe', 'Barbados', 'Barbados', 52
exec geo.paisSubRegiao 'Caribe', 'Bonaire, Saba e Santo Eustáquio', 'Bonaire, Saba e Santo Eustáquio', 535
exec geo.paisSubRegiao 'Caribe', 'Ilhas Virgens Britânicas', 'Ilhas Virgens Britânicas', 92
exec geo.paisSubRegiao 'Caribe', 'Ilhas Caimã', 'Ilhas Caimã', 136
exec geo.paisSubRegiao 'Caribe', 'Cuba', 'República de Cuba', 192
exec geo.paisSubRegiao 'Caribe', 'Curaçao', 'Curaçao', 531
exec geo.paisSubRegiao 'Caribe', 'Dominica', 'Comunidade da Dominica', 212
exec geo.paisSubRegiao 'Caribe', 'República Dominicana', 'República Dominicana', 214
exec geo.paisSubRegiao 'Caribe', 'Granada', 'Granada', 308
exec geo.paisSubRegiao 'Caribe', 'Guadalupe', 'Guadalupe', 312
exec geo.paisSubRegiao 'Caribe', 'Haiti', 'República do Haiti', 332
exec geo.paisSubRegiao 'Caribe', 'Jamaica', 'Jamaica', 388
exec geo.paisSubRegiao 'Caribe', 'Martinica', 'Martinica', 474
exec geo.paisSubRegiao 'Caribe', 'Montserrat', 'Montserrat', 500
exec geo.paisSubRegiao 'Caribe', 'Porto Rico', 'Porto Rico', 630
exec geo.paisSubRegiao 'Caribe', 'São Bartolomeu', 'Coletividade de São Bartolomeu', 652
exec geo.paisSubRegiao 'Caribe', 'São Cristóvão e Neves', 'Federação de São Cristóvão e Neves', 659
exec geo.paisSubRegiao 'Caribe', 'Santa Lúcia', 'Santa Lúcia', 662
exec geo.paisSubRegiao 'Caribe', 'São Martinho (França)', 'Coletividade de São Martinho (França)', 663
exec geo.paisSubRegiao 'Caribe', 'São Vicente e Granadinas', 'São Vicente e Granadinas', 670
exec geo.paisSubRegiao 'Caribe', 'São Martinho (Países Baixos)', 'São Martinho (Países Baixos)', 534
exec geo.paisSubRegiao 'Caribe', 'Trindade e Tobago', 'República de Trindade e Tobago', 780
exec geo.paisSubRegiao 'Caribe', 'Ilhas Turcas e Caicos', 'Ilhas Turcas e Caicos', 796
exec geo.paisSubRegiao 'Caribe', 'Ilhas Virgens Americanas', 'Ilhas Virgens Americanas', 850

exec geo.subRegiao     'América Latina e Caribe', 'América Central', '', 13
exec geo.paisSubRegiao 'América Central', 'Belize', 'Belize', 84
exec geo.paisSubRegiao 'América Central', 'Costa Rica', 'República da Costa Rica', 188
exec geo.paisSubRegiao 'América Central', 'El Salvador', 'República de El Salvador', 222
exec geo.paisSubRegiao 'América Central', 'Guatemala', 'República da Giatemala', 320
exec geo.paisSubRegiao 'América Central', 'Honduras', 'República das Honduras', 340
exec geo.paisSubRegiao 'América Central', 'México', 'Estados Unidos Mexicanos', 484
exec geo.paisSubRegiao 'América Central', 'Nicarágua', 'República da Nicarágua', 558
exec geo.paisSubRegiao 'América Central', 'Panamá', 'República do Panamá', 591

exec geo.subRegiao     'América Latina e Caribe', 'América do Sul', '', 5
exec geo.paisSubRegiao 'América do Sul', 'Argentina', 'República Argentina', 32
exec geo.paisSubRegiao 'América do Sul', 'Bolívia', 'Estado Plurinacional da Bolívia', 68
exec geo.paisSubRegiao 'América do Sul', 'Ilha Bouvet', 'Ilha Bouvet', 74
exec geo.paisSubRegiao 'América do Sul', 'Brasil', 'República Federativa do Brasil', 76
exec geo.paisSubRegiao 'América do Sul', 'Chile', 'República do Chile', 152
exec geo.paisSubRegiao 'América do Sul', 'Colômbia', 'República da Colômbia', 170
exec geo.paisSubRegiao 'América do Sul', 'Equador', 'República do Equador', 218
exec geo.paisSubRegiao 'América do Sul', 'Ilhas Malvinas', 'Ilhas Malvinas', 238
exec geo.paisSubRegiao 'América do Sul', 'Guiana Francesa', 'Coletiviade Territorial da Guiana Francesa', 254
exec geo.paisSubRegiao 'América do Sul', 'Guiana', 'República Colaborativa da Guiana', 328
exec geo.paisSubRegiao 'América do Sul', 'Paraguai', 'República do Paraguai', 600
exec geo.paisSubRegiao 'América do Sul', 'Peru', 'República do Peru', 604
exec geo.paisSubRegiao 'América do Sul', 'Ilhas Geórgia do Sul e Sanduíche do Sul', 'Ilhas Geórgia do Sul e Sanduíche do Sul', 239
exec geo.paisSubRegiao 'América do Sul', 'Suriname', 'República do Suriname', 740
exec geo.paisSubRegiao 'América do Sul', 'Uruguai', 'República Oriental do Uruguai', 858
exec geo.paisSubRegiao 'América do Sul', 'Venezuela', 'República Bolivariana da Venezuela', 862

exec geo.continente    'Terra', 'Américas', 'Continente Americano', 19
exec geo.regiao        'Américas', 'América do Norte', '', 21
exec geo.paisRegiao    'América do Norte', 'Bermudas', 'Bermudas', 60
exec geo.paisRegiao    'América do Norte', 'Canadá', 'Canadá', 124
exec geo.paisRegiao    'América do Norte', 'Groenlândia ', 'Groenlândia ', 304
exec geo.paisRegiao    'América do Norte', 'São Pedro e Miquelão', 'Coletividade de Ultramar de São Pedro e Miquelão', 666
exec geo.paisRegiao    'América do Norte', 'Estados Unidos da América', 'Estados Unidos da América', 840



exec geo.continente    'Terra', 'Antártica', 'Continente Antártico', 10



exec geo.continente    'Terra', 'Ásia', 'Continente Asiático', 142
exec geo.regiao        'Ásia', 'Ásia Central', '', 143
exec geo.paisRegiao    'Ásia Central', 'Cazaquistão', 'República do Cazaquistão', 398
exec geo.paisRegiao    'Ásia Central', 'Quirguistão', 'República Quirguiz', 417
exec geo.paisRegiao    'Ásia Central', 'Tajiquistão', 'República do Tajiquistão', 762
exec geo.paisRegiao    'Ásia Central', 'Turcomenistão', 'República do Turcomenistão', 765
exec geo.paisRegiao    'Ásia Central', 'Uzbequistão', 'República do Uzbequistão', 860

exec geo.regiao        'Ásia', 'Ásia Oriental', '', 30
exec geo.paisRegiao    'Ásia Oriental', 'China', 'República Popular da China', 156
exec geo.paisRegiao    'Ásia Oriental', 'Hong Kong', 'Região Administrativa Especial de Hong Kong', 344
exec geo.paisRegiao    'Ásia Oriental', 'Macau', 'Região Administrativa Especial de Macau', 446
exec geo.paisRegiao    'Ásia Oriental', 'Coréia do Norte', 'República Popular Democrática da Coréia', 408
exec geo.paisRegiao    'Ásia Oriental', 'Japão', 'Japão', 392
exec geo.paisRegiao    'Ásia Oriental', 'Mongólia', 'Mongolia', 496
exec geo.paisRegiao    'Ásia Oriental', 'Coréia do Sul', 'República da Coréia', 410

exec geo.regiao        'Ásia', 'Sudeste Asiático', '', 35
exec geo.paisRegiao    'Sudeste Asiático', 'Brunei', 'Estado de Brunei Darussalam', 96
exec geo.paisRegiao    'Sudeste Asiático', 'Camboja', 'Reino do Camboja', 116
exec geo.paisRegiao    'Sudeste Asiático', 'Indonésia', 'República da Indonésia', 360
exec geo.paisRegiao    'Sudeste Asiático', 'Laos', 'República Democrática Popular do Laos', 418
exec geo.paisRegiao    'Sudeste Asiático', 'Malásia', 'Malásia', 458
exec geo.paisRegiao    'Sudeste Asiático', 'Myanmar', 'República da União de Myanmar', 104
exec geo.paisRegiao    'Sudeste Asiático', 'Filipinas', 'República das Filipinas', 608
exec geo.paisRegiao    'Sudeste Asiático', 'Singapura', 'República da Singapura', 702
exec geo.paisRegiao    'Sudeste Asiático', 'Tailândia', 'Reino da Tailândia', 764
exec geo.paisRegiao    'Sudeste Asiático', 'Timor-Leste', 'República Democrática de Timor-Leste', 626
exec geo.paisRegiao    'Sudeste Asiático', 'Vietnã', 'República Socialista do Vietnã ', 704

exec geo.regiao        'Ásia', 'Sul da Ásia', '', 34
exec geo.paisRegiao    'Sul da Ásia', 'Afeganistão', 'Emirado Islâmico do Afeganistão', 4
exec geo.paisRegiao    'Sul da Ásia', 'Bangladesh', 'República Popular do Bangladesh', 50
exec geo.paisRegiao    'Sul da Ásia', 'Butão', 'Reino do Butão', 64
exec geo.paisRegiao    'Sul da Ásia', 'Índia', 'República da Índia', 356
exec geo.paisRegiao    'Sul da Ásia', 'Irã', 'República Islâmica do Irã', 364
exec geo.paisRegiao    'Sul da Ásia', 'Maldivas', 'República das Maldivas', 462
exec geo.paisRegiao    'Sul da Ásia', 'Nepal', 'República Democrática Federal do Nepal', 524
exec geo.paisRegiao    'Sul da Ásia', 'Paquistão', 'República Islâmica do Paquistão', 586
exec geo.paisRegiao    'Sul da Ásia', 'Sri Lanka', 'República Democrática Socialista do Sri Lanka', 144

exec geo.regiao        'Ásia', 'Ásia Ocidental', '', 145
exec geo.paisRegiao    'Ásia Ocidental', 'Arménia', 'República da Arménia', 51
exec geo.paisRegiao    'Ásia Ocidental', 'Azerbaijão', 'República do Azerbaijão', 31
exec geo.paisRegiao    'Ásia Ocidental', 'Bahrein', 'Reino do Bahrein', 48
exec geo.paisRegiao    'Ásia Ocidental', 'Chipre', 'República do Chipre', 196
exec geo.paisRegiao    'Ásia Ocidental', 'Geórgia', 'Geórgia', 268
exec geo.paisRegiao    'Ásia Ocidental', 'Iraque', 'República do Iraque', 368
exec geo.paisRegiao    'Ásia Ocidental', 'Israel', 'Estado de Israel', 376
exec geo.paisRegiao    'Ásia Ocidental', 'Jordânia', 'Reino Haxemita da Jordânia', 400
exec geo.paisRegiao    'Ásia Ocidental', 'Kuwait', 'Estado do Kuwait', 414
exec geo.paisRegiao    'Ásia Ocidental', 'Líbano', 'República do Líbano', 422
exec geo.paisRegiao    'Ásia Ocidental', 'Omã', 'Sultanato de Omã', 512
exec geo.paisRegiao    'Ásia Ocidental', 'Catar', 'Estado do Catar', 634
exec geo.paisRegiao    'Ásia Ocidental', 'Arábia Saudita', 'Reino da Arábia Saudita', 682
exec geo.paisRegiao    'Ásia Ocidental', 'Palestina', 'Estado da Palestina', 275
exec geo.paisRegiao    'Ásia Ocidental', 'Síria', 'República Árabe Síria', 760
exec geo.paisRegiao    'Ásia Ocidental', 'Turquia', 'República da Turquia', 792
exec geo.paisRegiao    'Ásia Ocidental', 'Emirados Árabes', 'Emirados Árabes Unidos', 784
exec geo.paisRegiao    'Ásia Ocidental', 'Iémen', 'República do Iémen', 887



exec geo.continente    'Terra', 'Europa', 'Continente Europeu', 150
exec geo.regiao        'Europa', 'Europa Oriental', '', 151
exec geo.paisRegiao    'Europa Oriental', 'Bielorrússia', 'República da Bielorrússia', 112
exec geo.paisRegiao    'Europa Oriental', 'Bulgária', 'República da Bulgária', 100
exec geo.paisRegiao    'Europa Oriental', 'Chéquia', 'República Checa', 203
exec geo.paisRegiao    'Europa Oriental', 'Hungria', 'Hungria', 348
exec geo.paisRegiao    'Europa Oriental', 'Polónia', 'República da Polónia', 616
exec geo.paisRegiao    'Europa Oriental', 'Moldávia', 'República da Moldova', 498
exec geo.paisRegiao    'Europa Oriental', 'Romênia', 'Romênia', 642
exec geo.paisRegiao    'Europa Oriental', 'Rússia', 'Federação Russa', 643
exec geo.paisRegiao    'Europa Oriental', 'Eslováquia', 'República Eslovaca', 703
exec geo.paisRegiao    'Europa Oriental', 'Ucrânia', 'Ucrânia', 804

exec geo.regiao        'Europa', 'Norte da Europa', '', 154
exec geo.paisRegiao    'Norte da Europa', 'Ilhas Aland', 'Ilhas Åland', 248
exec geo.subRegiao     'Norte da Europa', 'Ilhas do Canal', '', 830
exec geo.paisSubRegiao 'Ilhas do Canal', 'Guernsey', 'Bailiado de Guernsey', 831
exec geo.paisSubRegiao 'Ilhas do Canal', 'Jersey', 'Bailiado de Jersey', 832
exec geo.paisSubRegiao 'Ilhas do Canal', 'Sark', 'Sark', 680
exec geo.paisRegiao    'Norte da Europa', 'Dinamarca', 'Reino da Dinamarca', 208
exec geo.paisRegiao    'Norte da Europa', 'Estónia', 'República da Estónia', 233
exec geo.paisRegiao    'Norte da Europa', 'Ilhas Feroe', 'Ilhas Feroe', 234
exec geo.paisRegiao    'Norte da Europa', 'Finlândia', 'República da Finlândia', 246
exec geo.paisRegiao    'Norte da Europa', 'Islândia', 'Islândia', 352
exec geo.paisRegiao    'Norte da Europa', 'Irlanda', 'República da Irlanda', 372
exec geo.paisRegiao    'Norte da Europa', 'Ilha de Man', 'Ilha de Man', 833
exec geo.paisRegiao    'Norte da Europa', 'Letónia', 'República da Letónia', 428
exec geo.paisRegiao    'Norte da Europa', 'Lituânia', 'República da Lituânia', 440
exec geo.paisRegiao    'Norte da Europa', 'Noruega', 'República da Noruega', 578
exec geo.paisRegiao    'Norte da Europa', 'Jan Mayen', 'Jan Mayen', 744
exec geo.paisRegiao    'Norte da Europa', 'Suécia', 'Reino da Suécia', 752
exec geo.paisRegiao    'Norte da Europa', 'Reino Unido', 'Reino Unido da Grã-Bretanha e Irlanda do Norte', 826

exec geo.regiao        'Europa', 'Sul da Europa', '', 39
exec geo.paisRegiao    'Sul da Europa', 'Albânia', 'República da Albânia', 8
exec geo.paisRegiao    'Sul da Europa', 'Andorra', 'Principado de Andorra', 20
exec geo.paisRegiao    'Sul da Europa', 'Bósnia e Herzegovina', 'Bósnia e Herzegovina', 70
exec geo.paisRegiao    'Sul da Europa', 'Croácia', 'República da Croácia', 191
exec geo.paisRegiao    'Sul da Europa', 'Gibraltar', 'Gibraltar', 292
exec geo.paisRegiao    'Sul da Europa', 'Grécia', 'República Helênica', 300
exec geo.paisRegiao    'Sul da Europa', 'Vaticano', 'Estado da Cidade do Vaticano', 336
exec geo.paisRegiao    'Sul da Europa', 'Itália', 'República Italiana', 380
exec geo.paisRegiao    'Sul da Europa', 'Malta', 'República de Malta', 470
exec geo.paisRegiao    'Sul da Europa', 'Montenegro', 'Montenegro', 499
exec geo.paisRegiao    'Sul da Europa', 'Macedônia do Norte', 'República da Macedônia do Norte', 807
exec geo.paisRegiao    'Sul da Europa', 'Portugal', 'República Portuguesa', 620
exec geo.paisRegiao    'Sul da Europa', 'República de San Marino', 'Sereníssima República de San Marino', 674
exec geo.paisRegiao    'Sul da Europa', 'Sérvia', 'República da Sérvia', 688
exec geo.paisRegiao    'Sul da Europa', 'Eslovênia', 'República da Eslovênia', 705
exec geo.paisRegiao    'Sul da Europa', 'Espanha', 'Reino de Espanha', 724

exec geo.regiao        'Europa', 'Europa Ocidental', '', 155
exec geo.paisRegiao    'Europa Ocidental', 'Áustria', 'República da Áustria', 40
exec geo.paisRegiao    'Europa Ocidental', 'Bégica', 'Reino da Bélgica', 56
exec geo.paisRegiao    'Europa Ocidental', 'França', 'República Francesa', 250
exec geo.paisRegiao    'Europa Ocidental', 'Alemanha', 'República Federal da Alemanha', 276
exec geo.paisRegiao    'Europa Ocidental', 'Listenstaine', 'Principado do Listenstaine', 438
exec geo.paisRegiao    'Europa Ocidental', 'Luxemburgo', 'Grão-Ducado do Luxemburgo', 442
exec geo.paisRegiao    'Europa Ocidental', 'Mônaco', 'Principado de Mônaco', 492
exec geo.paisRegiao    'Europa Ocidental', 'Paises Baixos', 'Reino dos Paises Baixos', 528
exec geo.paisRegiao    'Europa Ocidental', 'Suíca', 'Conffederação Suíça', 756



exec geo.continente    'Terra', 'Oceania', 'Continente Oceânico', 9
exec geo.regiao        'Oceania', 'Austrália e Nova Zelândia', '', 53
exec geo.paisRegiao    'Austrália e Nova Zelândia', 'Austrália', 'Comunidade da Austrália', 36
exec geo.paisRegiao    'Austrália e Nova Zelândia', 'Ilha do Natal', 'Território da Ilha do Natal', 162
exec geo.paisRegiao    'Austrália e Nova Zelândia', 'Ilhas Cocos', 'Ilhas Cocos', 166
exec geo.paisRegiao    'Austrália e Nova Zelândia', 'Ilhas Heard e McDonald', 'Território das Ilhas Heard e McDonald', 334
exec geo.paisRegiao    'Austrália e Nova Zelândia', 'Nova Zelândia', 'Reino da Nova Zelândia', 554
exec geo.paisRegiao    'Austrália e Nova Zelândia', 'Ilha Norfolk', 'Ilha Norfolk', 574

exec geo.regiao        'Oceania', 'Melanésia', '', 54
exec geo.paisRegiao    'Melanésia', 'Fiji', 'República das Fiji', 242
exec geo.paisRegiao    'Melanésia', 'Nova Caledônia', 'Nova Caledônia', 540
exec geo.paisRegiao    'Melanésia', 'Papua-Nova Guiné', 'Estado Independente da Papua-Nova Guiné', 598
exec geo.paisRegiao    'Melanésia', 'Ilhas Salomão', 'Ilhas Salomão', 90
exec geo.paisRegiao    'Melanésia', 'Vanuatu', 'República de Vanuatu', 548

exec geo.regiao        'Oceania', 'Micronésia', '', 57
exec geo.paisRegiao    'Micronésia', 'Guam', 'Guam', 316
exec geo.paisRegiao    'Micronésia', 'Kiribati', 'República de Kiribati', 296
exec geo.paisRegiao    'Micronésia', 'Ilhas Marshall', 'República das Ilhas Marshall', 584
exec geo.paisRegiao    'Micronésia', 'Micronésia', 'Estados Federados da Micronésia', 583
exec geo.paisRegiao    'Micronésia', 'Nauru', 'República de Nauru', 520
exec geo.paisRegiao    'Micronésia', 'Ilhas Marianas do Norte', 'Comunidade das Ilhas Marianas Setentrionais', 580
exec geo.paisRegiao    'Micronésia', 'Palau', 'República de Palau', 585
exec geo.paisRegiao    'Micronésia', 'Ilhas Menores Distantes dos Estados Unidos', 'Ilhas Menores Distantes dos Estados Unidos', 581

exec geo.regiao        'Oceania', 'Polinésia', '', 61
exec geo.paisRegiao    'Polinésia', 'Samoa Americana', 'Samoa Americana', 16
exec geo.paisRegiao    'Polinésia', 'Ilhas Cook', 'Ilhas Cook', 184
exec geo.paisRegiao    'Polinésia', 'Polinésia Francesa', 'Polinésia Francesa', 258
exec geo.paisRegiao    'Polinésia', 'Niuê', 'Niuê', 570
exec geo.paisRegiao    'Polinésia', 'Ilhas Picárnia', 'Ilhas Picárnia', 612
exec geo.paisRegiao    'Polinésia', 'Samoa', 'Estado Independente da Samoa', 882
exec geo.paisRegiao    'Polinésia', 'Toquelau', 'Toquelau', 772
exec geo.paisRegiao    'Polinésia', 'Tonga', 'Reino de Tonga', 776
exec geo.paisRegiao    'Polinésia', 'Tuvalu', 'Tuvalu', 798
exec geo.paisRegiao    'Polinésia', 'Wallis e Futuna', 'Territõrio das Ilhas Wallis e Futuna', 876
 
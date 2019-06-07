
--################################################
-- DATA INSERTION
--################################################

insert into Vinhos.Users values
    ('José Gaspar',	           '1997/01/10',	'ola123',	'zsdasd',	'12345678'),
    ('Pedro Barreiro' ,        '11/02/1967	','ola123'	,'asdasd'     ,'50240197'),
    ('João Silva e Sousa' ,    '09/11/1956	','ola123'	,'asdasd'     ,'50114523'),
    ('Francisco Baptista' ,    '06/12/1965	','ola123'	,'asda1'  ,'11235204'),
    ('Patrícia Peixoto' ,      '11/02/1977	','ola123'	,'asd124'     ,'13453212'),
    ('Anselmo Mendes' ,        '11/02/1966	','oas12'	,'asda1'  ,'10022021'),
    ('Francisco Marques Leandro','09/11/1956	','12sada'	,'asd124'     ,'10022033'),
    ('Rui Walter Cunha'          ,'10/01/1987	','dasdq21'	,'sadq21'     ,'10022044'),
    ('Hélder Cunha'             ,'09/11/1956	','qweqw'	,'qeqweeq'    ,'10022055'),
    ('Ana Rola '                ,'11/02/1966	','aw1231'	,'asd123'     ,'12341421'),
    ('Manuel Vieira'            ,'11/02/1967	','asd1q23'	,'qeqweeq'    ,'12465123'),
    ('Luís Cabral de Almeida' ,' 10/01/1987','	ola123'	,'asda1'  ,'32132132');
    

insert into Vinhos.Owner values
    ('Pedro Barreiro' ,  'Quinta da Barreira-Vitivinicultura',  '21757401','50240197'),
    ('João Silva e Sousa' ,  'Lua Cheia em Vinhas Velhas',  '21444455','50114523'),
    ('Anselmo Mendes' ,  'Anselmo Mendes Vinhos',  '21444466','10022021'),
    ('Francisco Marques Leandro' ,  'Casa Santa Eulália',  '21444477','10022033'),
    ('Rui Walter Cunha' ,  'Quinta de Paços',  '21444488','10022044'),
    ('Hélder Cunha' ,  'Casca Wines',  '21444499','10022055');


insert into Vinhos.Enologos VALUES
    ('José Gaspar              ',   '5',  '11111',   '12345678'),
    ('João Silva e Sousa       ',   '3',  '11112',   '50114523'),
    ('Francisco Baptista       ',   '6',  '11113',   '11235204'),
    ('Patrícia Peixoto         ',   '2',  '11114',   '13453212'),
    ('Anselmo Mendes           ',   '12',  '11115',   '10022021'),
    ('Francisco Marques Leandro',   '7',  '11116',   '10022033'),
    ('Rui Walter Cunha         ',   '15',  '11117',   '10022044'),
    ('Ana Rola                 ',   '12',  '11118',   '12341421'),
    ('Hélder Cunha             ',   '4',  '11119',   '10022055'),
    ('Manuel Vieira            ',   '3',  '11120',   '12465123'),
    ('Luís Cabral de Almeida   ',   '5',  '11121',   '32132132');

insert into Vinhos.Regiao values
        ('normal','quente','Reg. Lisboa','2565-136'),
        ('rochoso','ameno','DOC Douro','5110-214 '),
        ('argiloso','quente','Alentejo','7900-573'),
        ('normal','frio','Monção e Melgaço','4950-483'),
        ('rochoso','ameno','Regional Minho','4850-481');

insert into Vinhos.Quinta values
    ('Quinta da Barreira', 'casa123',200,'Fundada nos finais do século XIX, esta empresa de cariz familiar foi adquirida em 1954, mantendo-se a partir dessa data na posse da atual família', '255111111',1),
    ('Lua Cheia em Vinhas Velhas','cas231',260,'Lua Cheia em Vinhas Velhas is a result of the passion to display the individuality and character that the creators of this project have with the Douro region for more than two decades. After so many years of being surprised by this unique wine region, in 2009 the time arrived to show what they have been seeing in Douro wines. The company history began in that year with the production of white wines from Murça, an area forgotten by progress, but that produces unique wines with full identity. In 2010, work began on an investment in the winery in Martim, Douro, and in 2012, in the cradle of Alvarinho, Monção region. In 2013, a partnership was started in Alentejo, vinifying, in third party facilities, the grapes chosen and acquired in the region of Estremoz. In 2017, Lua Cheia has extended its presence into other Portuguese wine region – Dão.','255111122',2),
    ('Casa de Santa Vitória','123asd2',270,'A Santa Vitória é uma empresa do Grupo Vila Galé focada na produção e comercialização de vinhos e azeites alentejanos de qualidade superior.','255111222',3),
    ('Anselmo Mendes Vinhos','oooo123',400,'Foi com a casta Alvarinho em Monção e Melgaço, que Anselmo Mendes começou a produzir, em 1998. A adega, na zona do Vale do Minho, é um espaço de experimentação e investigação, a partir de onde a paixão de Anselmo Mendes pelo vinho e pela região ganha forma e gosto. É um lugar de reinvenção, para fazer de cada vinho uma expressão da terra elevada à sua forma mais sublime, um traço cultural, um rasgo de carácter.','255111333',4),
    ('Casa Santa Eulália','dsa12',200,'criada no séc. XVII, situa-se em Atei, Mondim de Basto, região de vinho verde. 38 hectares de vinhas para Viticultura e Enoturismo.','255111444',5),
    ('Quinta das Parcelas','kaskk23',250,'Virada a Nascente/SE, esta jovem Quinta fica situada no vale da Régua na margem direita do rio Douro na Região Demarcada do Douro - Baixo Corgo, captando soberba vista para a cidade e rio Douro','255123111',2), 
    ('Quinta de Paços','asd12',199,'A Quinta de Paços Sociedade Agrícola, Lda. é uma empresa familiar que explora o seu património agrícola procurando produzir vinhos de alta qualidade com uma personalidade distinta, resultante duma especial ênfase no seu carácter natural e autêntico.','255111555',5),
    ('Casca Wines','dawe1',100,'Tudo começou na micro-região de Colares. Na serra de Sintra, o ponto mais ocidental da Europa continental, onde grandes produtores de vinho foram desafiados pelos ventos atlânticos por mais de 900 anos. Hélder Cunha decidiu produzir vinhos verdadeiramente únicos, unindo a história com qualidade.','255111666',2),
    ('Quinta de Cottas','asdasd2',180,'A Quinta de Cottas dedica-se à produção de vinhos de elevada qualidade e com forte personalidade. A Quinta de Cottas, com uma área de 10 ha, localizada na Região Demarcada do Douro, no Cima Corgo, tem as suas vinhas povoadas com as tradicionais castas do Douro por forma a preservar o património genético da região. Beneficiando de uma excelente exposição solar, as suas velhas cepas plantadas nos solos xistosos do Douro, oferecem uvas de um perfil e carácter únicos.','255255255',2),
    ('Herdade do Peso','alentejo',200,'A Herdade do Peso acolhe uma barragem, que ocupa uma área de 20 hectares e cuja água é preciosa para o sistema de rega da vinha e de um extenso olival. A Herdade do Peso está situada em Pedrogão, no concelho da Vidigueira - designação associada à abundância de videiras, tal a importância que essa cultura tem tido ao longo dos tempos na região. A Herdade do Peso ocupa uma área total de 465 hectares. Atualmente encontram-se plantados 120 hectares, sendo 112 hectares de uvas (Aragonez, Alicante Bouschet, Syrah, Touriga Nacional, Petit Verdot e Cabernet Sauvignon) e oito hectares de uvas brancas (Antão Vaz, Arinto e Chardonnay). Antes de adquirir a Herdade do Peso, a Sogrape Vinhos comprava já desde 1992 as uvas da propriedade ao anterior proprietário, um familiar de Fernando Guedes.','255123421',3);


insert into Vinhos.OwnerShip VALUES
    ('1',	'1'),
    ('2',	'2'),
    ('1',	'3'),
    ('3',	'4'),
    ('4',	'5'),
    ('5',	'7'),
    ('6',	'8'),
    ('2',	'6'),
    ('3',	'9'),
    ('5',	'10');



insert into Vinhos.Vinho values
    ('BACELO NOVO BRANCO 2015',12,3.90,6,'Cor citrino claro.','Como aperitivo','10/12ºC',1,1),
    ('BACELO NOVO TINTO 2014',13,3.90,7,'Cor rubi intenso com laivos', 'com bacalhau no forno','15/17ºC',2,2),
    ('BACELO NOVO TINTO 2015',14,3.90,5,'Cor rubi. Aromas intensos','com carnes vermelhas','15/17ºC',3,3),
    ('ALVARINHO 2016',12,7.00,9,'Cor amarelo citrino. Aromas cítricos e de frutas tropicais. Na boca apresenta-se fresco e pleno de mineralidade. Encorpado, bom volume e equilíbrio e com uma acidez vibrante a dar-lhe frescura.Final longo e com grande complexidade típico da casta Alvarinho.','como aperitivo ou com canapés, marisco, peixes diversos, queijos e pratos de aves.','8/10ºC',4,4),
    ('QUINTA DA BARREIRA RESERVA TINTO 2015',14,5.90,4,'Cor rubi fechado. Aroma com boa intensidade, complexo. Notas de frutos vermelhos, pretos e pimento verde. Na boca apresenta-se jovem, com taninos firmes mas com bom corpo e estrutura. Equilibrado. Final longo.','com assados, carnes vermelhas e queijos fortes. Agradece decantação.','18ºC',1,1),
    ('CASA SANTA EULÁLIA SUPERIOR ALVARINHO 2016',12,7.00,6,'Cor amarelo citrino. Aroma de boa intensidade, frutado e floral com notas tropicais. A boca confirma a fruta mostrando-se fresco e equilibrado. Final persistente.','com mariscos, peixes e carnes brancas.','8/10ºC',5,5),
    ('CASA DE PAÇOS SUPERIOR 2015',	12,7.75,7,'Cor límpida, amarelo-citrino.Aroma limpo e fresco, notas de citrinos, frutos tropicais e um toque mineral. Na boca a boa acidez dá-lhe frescura, boa fruta. Final longo.',' com mariscos e peixes','9/10ºC',5,7),
    ('NOMEVINHO MILHAFRE NEGRO RESERVA 2014',13,8.55,	8,'Cor rubi escuro. Aroma jovem, fruta fresca com um ligeiro toque de madeira. Na boca é suave, bem estruturado e equilibrado. Boa acidez. Final persistente.',' com queijos, enchidos, caça e carnes vermelhas assadas.','16/18ºC',2,6),
    ('ALVARINHO CONTACTO 2016',	13,9.50,8, 'Cor amarelo-citrino.Aroma intenso, complexo e fresco, notas cítricas com algum mineral e um toque tropical. Excelente na boca, muito bem equilibrado, com boa estrutura e volume. Boa acidez e belas notas minerais. Bom final.	','como aperitivo ou com canapés, marisco, peixes diversos, queijos e pratos de aves.','8/10ºC',5,4),
    ('CASCAS 2016',12,4.20,5,'Cor amarelo-citrino. Boa intensidade aromática, aroma frutado com leves notas florais. Na boca é equilibrado com uma boa acidez a dar-lhe frescura.',' com carnes brancas, aves de capoeira, massas condimentadas e queijos suaves.',	'14/16ºC',	2,8),
    ('NOMEVINHO LUA CHEIA EM VINHAS VELHAS RESERVA ESPECIAL 2014',13,8.40,8,'Cor vermelho profundo. Aroma muito intenso e poderoso mas fresco, notas de bergamota, frutos do bosque (mirtilo e amora preta) e de boa madeira. Na boca é estruturado mas elegante, fresco e bem equilibrado. Final longo com notas florais e de frutos do bosque.','Com carnes vermelhas, caça e pratos condimentados, cozinha regional e mediterrânica.','16/18ºC',2,2),
    ('NOMEVINHO COTTAS 2013',13,7.00,7,'Aromas frescos bem presentes de groselha preta e canela torrada. Macio na boca com taninos elegantes. Bom volume e  Final persistente com a presença da fruta.','Com massas, aves, carnes brancas e vermelhas.','16º C',2,9),
    ('NOMEVINHO SOSSEGO ROSÉ 2016',12,5.00,9,'Cor rosa-cereja, aroma intenso a cereja e frutos vermelhos. Na boca apresenta-se, fresco, equilibrado. Final longo.','Com saladas e massas.','8/10ºC',3,10),
    ('NOMEVINHO MONTE CASCAS 2016',12,5.75,6,'Cor rosa claro (pétala de rosa). Aroma levemente frutado com notas florais. Na boca é fresco com notas de frutos vermelhos. Final agradável.','Sozinho ou acompanhando aperitivos, mariscos, pratos de peixe, massas e queijos suaves.','10/12ºC',2,8),
    ('NOMEVINHO PLAINAS VINHÃO GRANDE ESCOLHA 2016',13,4.70,5,'Cor granada intensa, quase opaca. Aroma de frutos pretos maduros. Na boca é a acidez dá-lhe frescura, intenso e equilibrado. Final persistente.','Com pratos de carnes vermelhas e da cozinha regional minhota.','12/14ºC',2,5);



insert into Vinhos.Castas VALUES
        ('Branco','Chardonnay é uma uva da família da Vitis vinifera, a partir da qual é fabricado vinho branco de qualidade.','Chardonnay'),
        ('Branco','Uma casta de uva branca da família das vitis vinifera cultivada, de maneira geral, em todas as regiões','Arinto'),
        ('Tinto','Touriga Nacional é uma casta de uva tinta da família das Vitis Viniferas originária de Portugal.','Touriga Nacional'),
        ('Tinto','A Touriga Francesa é uma das principais castas utilizadas na produção de vinho do Porto.',' TourigaFranca'),
        ('Tinto','Tempranillo é uma casta de uva tinta da família da Vitis vinifera, uma das castas mais conhecidas da Península Ibérica.','Tinta Roriz'),
        ('Branco','Alvarinho é uma casta branca da espécie da Vitis vinifera originária de norte de Portugal. É a mais nobre das castas brancas portuguesas e produz um vinho de elevadíssima qualidade','Alvarinho'),
        ('Tinto','Cabernet sauvignon é uma casta de uvas da espécie Vitis vinifera a partir da qual é fabricado vinho. Originária da região de Bordeaux, no sudoeste da França, ela é a uva vinífera mais difundida no mundo, encontrando-se em todas as zonas temperadas e quentes.','Cabernet Sauvignon'),
        ('Branco','Proporciona vinhos vibrantes e de acidez viva, refrescantes e com forte pendência mineral, e elevado potencial de guarda. A acidez firme será o principal cartão-de-visita da casta Arinto, garantindo-lhe a adjectivação de casta “melhorante” em muitas regiões portuguesas.','Loureiro'),
        ('Branco','Fernão-Pires é uma casta de uva branca da família das vitis vinifera cultivada em diversas regiões de Portugal, nomeadamente na Bairrada, Estremadura, Ribatejo e Terras do Sado. Outras designações São Amaral, Gaeiro, Fernão Pirão','Fernao Pires'),
        ('Tinto','Origina vinhos macios, muito encorpados, ricos de cor e geralmente muito alcoólicos. Tem fraca acidez e aromas podendo conduzir a vinhos um tanto rústicos (Loureiro, 2005). O aroma é horizontal, ou seja, tem um acesso ao nariz lento, aveludado, delicado, como que pedindo que se mergulhe no seu interior. Esta sua característica aromática aberta e feminina contrasta bem com a da casta Roriz. O aroma floral aparece com mais frequência nos sítios mais húmidos e o aroma a frutos vermelhos em regiões mais quentes. O ataque na boca é aveludado, cheio, quente e terno (Almeida, 1990).','Tinta Barroca'),
        ('Branco','A verdelho é uma variedade de uvas brancas, casta cultivada em todo o Portugal','Gouveio'),
        ('Branco','É particularmente sensível ao oídio e moderadamente à podridão, míldio e desavinho, proporcionando rendimentos extremamente variáveis e inconsistentes. Os vinhos anunciam, por regra, sintomas melados, no nariz e boca, vagas notas de cera e noz-moscada, aliados a sensações fumadas, mesmo quando o vinho não sofre qualquer estágio em madeira','Malvasia Fina'),
        ('Branco',null,'Codega'),
        ('Branco','Casta de vigor e produtividade médios, sendo sensível ao míldio e pouco sensível ao oídio e à podridão cinzenta. O cacho é grande e compacto, com bago de tamanho médio, arredondado, de cor amarelada, com película medianamente espessa, polpa suculenta.','Larinho'),
        ('Tinto','Vinhas velhas são responsáveis por produzir vinhos que expressam muito bem o terroir local, já que suas raízes atingem maior profundidade, uma diversidade maior de camadas do solo e carregam complexidade de compostos para as folhas e cachos e uvas. Mas isso não está ligado necessariamente a uma maior qualidade do produto final, de forma alguma.','Vinhas Velhas'),
        ('Tinto','Muito bem adaptada ao clima quente e seco do vale do Douro, a Tinto Cão é uma uva reconhecida por sua qualidade e pelo caráter apimentado. Seus cachos pequenos, o seu amadurecimento tardio, a cor verde-pálida das folhas da sua videira, a cor negra-azul dos seus bagos espessos, e sua película grossa e densa, que lhe garante alta resistência a ataques de doenças e podridão, são as características principais dessa nativa portuguesa.','Tinto Cão'),
        ('Tinto','É a cor que singulariza e diferencia o Vinhão, de cachos de tamanho médio com bagos médios e uniformes de cor negro-azulada, produzindo vinhos pretos, escuros e opacos, fechados e quase impenetráveis à luz. Foram estas características tão peculiares que a tornaram tão apetecível no Douro, graças à necessidade de extrair rapidamente a cor para o Vinho do Porto. É a casta tinta mais cultivada na região do Vinho Verde, oferecendo vinhos rústicos, de acidez muito elevada, notórios pela acidez inquieta.','Vinhão');


insert into Vinhos.Tem values
(1,1),
(1,2),
(2,3),
(2,4),
(2,5),
(4,6),
(5,3),
(5,7),
(7,6),
(7,2),
(7,8),
(7,9),
(8,3),
(8,4),
(8,5),
(8,10),
(10,11),
(10,12),
(10,13),
(10,14),
(11,15),
(12,3),
(12,4),
(12,16),
(13,3),
(14,3),
(14,4),
(14,5),
(15,17);


insert into Vinhos.VinhosAssociados VALUES
(11111,	1),
(11112,	2),
(11113,	3),
(11114,	3),
(11115,	4),
(11111,	4),
(11116,	5),
(11115,	5),
(11117,	7),
(11115,	9),
(11118,	8),
(11112,	11),
(11113,	11),
(11112,	12),
(11120,	12),
(11121,	13),
(11119,	14),
(11115,	15),
(11116,	15);


insert into Vinhos.Derivados VALUES
('BACELO NOVO',	'Volume: 0,70L,Grau de álcool: 40º',1),
('aguaArdente',	'Volume: 0,70L,Grau de álcool: 40º',2);





insert into Vinhos.Distribuidor values
('HERITAGE WINES - DISTRIBUIÇÃO DE BEBIDAS, LDA','4400-088'),
('DECANTE - VINHOS, LDA','8365-307'),
('DECOV - DESTILAÇÃO E COMERCIO DE VINHOS, S.A.','4700-133'),
('DAVID DELAFORCE - VINHOS, LDA','4405-853'),
('ROTA VERDE - ASSOCIAÇÃO PARA O DESENVOLVIMENTO DA ROTA DOS VINHOS VERDES','4050-501'),
('RE - VINHOS E DERIVADOS, UNIPESSOAL, LDA','4960-341'),
('DGM ORGANOLEPTICS - COMÉRCIO E DISTRIBUIÇÃO DE VINHOS E DERIVADOS, UNIPESSOAL, LDA','4580-156'),
('CORAL DO DEUS MENINO DE FIGUEIRO DOS VINHOS','3260-407'),
('ESSÊNCIAS & DESEJOS - COMÉRCIO DE VINHOS, UNIPESSOAL, LDA','2630-380'),
('ASSOCIAÇÃO DESPORTIVA DE FIGUEIRÓ DOS VINHOS','3260-419'),
('CAVES SANTA MARTA - VINHOS E DERIVADOS, C.R.L.','5030-477');


insert into Vinhos.Distribui values
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10),
(2,11),
(3,6),
(4,7),
(1,8),
(2,9),
(10,1),
(3,2);



insert into Vinhos.Concursos VALUES
('melhor tinto','BACCHUS 2015'),
('melhor branco','Berliner Wein Trophy 2015'),
('melhor rose','Catavinum World Wine and Spirits Competition 2015'),
('melhor vinho','Challenge International du Vin 2015'),
('melhor vinho','Concours International des Vins Monde');

insert into Vinhos.Participa values
(4,1),
(4,2),
(4,3),
(4,4),
(4,5),
(4,6),
(4,7),
(5,7),
(5,8),
(5,9),
(5,10),
(5,11),
(5,12),
(5,13),
(5,14),
(5,15),
(5,3),
(5,4),
(4,9),
(4,10),
(1,2),
(1,5),
(1,15),
(1,12),
(1,8),
(2,10),
(2,14),
(2,3),
(3,4),
(3,5),
(3,6);


insert into Vinhos.SaoJuri values
(11111,4),
(11112,4),
(11113,4),
(11114,4),
(11115,4),
(11116,5),
(11117,5),
(11118,5),
(11119,4),
(11120,4),
(11121,1),
(11111,2),
(11112,2),
(11113,2),
(11114,2),
(11115,1),
(11116,1),
(11117,1),
(11118,2),
(11116,3),
(11117,3);


INSERT into Vinhos.Posicoes VALUES
(1,1,2),
(2,1,15),
(3,1,5),
(1,2,10),
(2,2,14),
(3,2,3),
(1,3,5),
(2,3,4),
(3,3,6),
(1,4,3),
(2,4,5),
(3,4,7),
(1,5,10),
(2,5,8),
(3,5,15);

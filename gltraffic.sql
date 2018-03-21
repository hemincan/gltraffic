/*
Navicat MySQL Data Transfer

Source Server         : hemincan
Source Server Version : 50712
Source Host           : localhost:3306
Source Database       : gltraffic

Target Server Type    : MYSQL
Target Server Version : 50712
File Encoding         : 65001

Date: 2018-03-21 23:34:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_tiltle` varchar(50) DEFAULT NULL,
  `article_content` text,
  `article_publictime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `article_public_user` int(11) DEFAULT NULL,
  `article_state` int(11) DEFAULT NULL,
  `article_readed` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `article_public_user` (`article_public_user`),
  CONSTRAINT `article_ibfk_1` FOREIGN KEY (`article_public_user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('12', '为什么不能乱停车？', '<p><img src=\"http://127.0.0.1:8080/gltraffic/adminsystem/umeditor/jsp/upload/20170513/48031494657421672.jpg\"/></p>', '2017-05-13 14:37:15', '27', '0', '7');
INSERT INTO `article` VALUES ('13', '非机动车逆行将罚50元', '<p><strong style=\"text-align: left; \">交警部门近期将开展非机动车违法行为专项整治</strong><span style=\"text-align: left; \">&nbsp;</span><strong style=\"text-align: left; \">　</strong></p><p style=\"text-align: center; \">	<strong><img alt=\"\\\" src=\"http://img.findlawimg.com/info/2012/1031/20121031103551833.jpg\" style=\"width: 500px; height: 400px; \"/></strong></p><p>	　　“冲红灯、逆行、抢道……”这些交通违法行为不仅仅存在于驾驶机动车的时候，踩单车时也要注意，因为同样影响了交通出行安全，会受到处罚。</p><p>	　　昨日，广州交警部门宣称，近期将针对非机动车进入禁行路段、与机动车抢道、冲红灯、逆向行驶、横过道路没有下车推行等违法行为开展专项整治，对违反相关法律法规的，交警部门将严格执法，处以20至50元不等的处罚。</p><p>	　<strong>　市区多条道路禁止非机动车通行</strong></p><p>	　　广州市区的高速公路、城市快速路(广园快速路、科韵路等)及市区道路的立交桥、高架路(内环路、人民高架桥、东濠涌高架路等)、隧道、部分横跨珠江的大桥都是禁止非机动车通行的。</p><p>	　　其中，广州市中心区东风路、中山五路(吉祥路口至北京路口)、沿江中路(文德路口至北京路口，东往西)、沿江西路(解放路口至新堤一横路口，东往西)、广园路(云台花园至广州大道北路口)、广州大道北(鼎龙酒店至广园路口，北往南)、兴华路(天平架公交车站至燕岭路口，北往南)、沙太路(北环高速入口至兴华路口，北往南)、中山大道黄埔支线(86中至莲溪村)等多条道路禁止非机动车通行。</p><p>	　　靖海路、一德路(人民路口至仁济路口)、海珠南路(一德路口至长堤大马路口)、长堤大马路(解放路口至海珠路口)等路段禁止人力三轮车通行。</p><p><br/></p>', '2017-05-22 12:48:09', '27', '0', '10');
INSERT INTO `article` VALUES ('14', '小学生交通安全教育知识', '<p><strong>引言：</strong>我们知道人、车、路是构成道路交通的三个基本要素。作为我们小学生来说，无论你是在上学、放学途中，还是乘坐父母家长的接送车，或乘坐公交车，都等于直接参与了道路交通。因而掌握和了解有关交通安全教育常识就很有必要了。</p><p style=\"text-align: center\">	<a href=\"http://undefined\" target=\"_blank\"><img alt=\"交通安全知识\" src=\"http://img.findlawimg.com/info/2013/0828/20130828095846348.jpg\" style=\"width: 483px; height: 301px\" title=\"道路交通通行法律规定\"/></a></p><p>	　<strong>　一、行走的安全常识</strong></p><p>	<strong>　　每位同学必须牢记如下行走安全常识：</strong></p><p>	<strong>　　1、指挥灯信号</strong></p><p>	　　绿灯亮时，准许行人通行;黄灯亮时，不准行人通行，但已进入人行道的行人，可以继续通行;红灯亮时，不准行人通行;黄灯闪烁时，行人须在确保安全的原则下通行。</p><p>	　<strong>　2、人行横道信号灯</strong></p><p>	　　绿灯亮时，准许行人通过人行横道;绿灯闪烁时，不准行人进入人行横道，但已进入人行横道的可以继续通行;红灯亮时，不准行人进入人行横道。</p><p>	　<strong>　3、行人必须遵守的规定</strong></p><p>	　　行人须在人行道内行走，没有人行道靠右边行走;穿越马路须走人行横道;通过有交通信号控制的人行横道，须遵守信号的规定;通过没有交通信号控制的人行道，要左顾右盼，注意车辆来往，不准追逐，奔跑;没有人行横道的，须直行通过，不准在车辆临近时突然横穿;有人行过街天桥或地道的，须走人行过街天桥或地道;不准爬马路边和路中的护栏、隔离栏，不准在道路上推扒车、追车、强行拦车或抛物击车。</p><p>	　　<strong>4、行走时，哪些情况最危险呢?</strong></p><p>	　　(1)横穿马路很容易出危险。</p><p>	　　(2)三五成群横着走在非人行道上，这样最容易发生交通事故。</p><p>	　　(3)上、下班高峰过后，马路上车辆稀少，因为路中车少人稀思想麻痹。麻痹加麻痹就等于危险。</p><p>	　　(4)行走时一心两用，边走边看书，或边走边想问题，或边走边聊天，边走边玩……这样做，可能车子不来撞你，你倒自己去撞车子，因此也十分危险。</p><p>	　<strong>　二、骑车安全</strong></p><p>	　　1、不满12周岁的孩子，不能在道路上骑车。这是交通规则规定的。</p><p>	　　2、不打伞骑车。</p><p>	　　3、不脱手骑车。</p><p>	　　4、不骑车带人。</p><p>	　　5、不骑&quot;病&quot;车。</p><p>	　　6、不骑快车。</p><p>	　　7、不与机动车抢道。</p><p>	　　8、不平行骑车。</p><p>	　　最后还要注意，在恶劣的天气如雷雨、台风、下雪、或积雪未化、道路结冰等情况下，也不要骑车。</p><p>	　　<strong>三、乘车安全</strong></p><p>	　　1、上车前先看清公共汽车是哪一路，因为公共汽车停靠站，往往是几路公共汽车同一个站台，慌忙上车，容易乘错车。</p><p>	　　2、待车子停稳后再上车或下车，上车时将书包置于胸前，以免书包被挤掉，或被车门轧住。</p><p>	　　3、上车后不要挤在车门边，往里边走，见空处站稳，并抓住扶手，头、手、身体不能伸向窗外，否则容易发生伤害事故。</p><p>	　　4、乘车要尊老爱幼讲礼貌，见老弱病残及孕妇要主动让座。</p><p>	　　5、乘车时不要看书，否则会损害眼睛。</p><p><br/></p>', '2017-05-23 21:55:06', '27', '0', '28');
INSERT INTO `article` VALUES ('15', '暴雨天气驾车安全知识', '<p>虽然立秋已过，但最近天气时冷时热，更是暴雨连连，而在这样的雨天行车会给驾驶带来诸多不便，雨帘会遮挡视线，雨声会影响听力，路面上的雨水、泥泞会使附着力下降，制动距离延长，转弯时车速稍快或制动稍急，就会出现侧滑，路基疏松时还会出现路面坍塌等。对于这些情况，车主应该做到哪几方面?</p><p style=\"text-align: center\">	<a href=\"http://undefined\" target=\"_blank\"><img alt=\"交通安全知识\" src=\"http://img.findlawimg.com/info/2013/0820/20130820095649399.jpg\" style=\"width: 450px; height: 329px\" title=\"暴雨来袭如何停车避险\"/></a></p><p>	　<strong>　1、慢速行驶。</strong></p><p>	　　中雨时，车速应控制在40km/h(公里/小时)为宜;小雨时，可适当提高车速;如遇大雨，以20km/h(公里/小时)的速度行驶便可以了。遇到暴雨，落到风窗玻璃的雨水来不及刮去会严重影响视线，驾驶人应立即选择宽阔路面停驶，并开启示宽灯、报警灯，以提示前后来车注意。</p><p>	<strong>　　2、雨天尽量不超车。</strong></p><p>	　　雨天超车的条件比平时要求较高，只能在视线清晰、路面宽阔、平坦无积水的条件下进行;否则，以跟行为宜。</p><p>	　<strong>　3、转弯时预防侧滑。</strong></p><p>	　　每遇转弯要提前抬起加速踏板，利用车辆惯性缓慢通过，争取做到中途不加速、不制动。遇有急弯时，要提前鸣笛，沿着自己的行驶路线行驶。</p><p>	<strong>　　4、雨路行驶要慎用制动。</strong></p><p>	　　因水膜现象容易使制动时打滑，需要减速时应以加速踏板控速为主;情况紧急非用制动不可时，要缓缓加力，感觉车尾侧滑就要立即抬起制动踏板，待侧滑消除后再缓缓踏下。</p><p>	　<strong>　5、路遇行人或自行车，应提前放慢速度，并鸣笛提示，尽量给他们留出便于行走的路面。</strong></p><p>	　　遇到横穿公路的情况时，切不要与他们抢道。交会时，应防止甩出的浊水溅到他们身上。</p><p>	<strong>　　6、遇有积水横陈路面时的驾驶技巧。</strong></p><p>	　　应沿着前车压下的轮迹通过，无轮迹可依时，应停车观察，选择积水较浅处通过。通过后要及时检查制动效果，如果制动距离延长，证明轮鼓里进水，应采用制动的方法让轮鼓升温，使制动力恢复正常。</p><p>	　<strong>　7、遇洪水时的驾驶技巧。</strong></p><p>	　　1)在山区的谷地行车，遇洪水沿路面冲下时，应迅速将车开上附近的小丘、山梁进行躲避，待洪水过后再行;</p><p>	　　2)在水中要非常小心地驾驶，观察道路情况;</p><p>	　　3)在洪水中出现熄火现象，如果洪水还在不断上涨，应立即弃车，因为在不断上涨的洪水中试图驱动一辆抛锚的车，是十分危险的;</p><p>	　　4)不要企图穿越被洪水淹没的公路，这样的结果往往会被上涨的水困住。</p><p>	　<strong>　8、在沿河堤的路上行驶，应尽量靠近公路里侧行驶。</strong></p><p>	　　超车、会车要更加小心，不要太靠近边缘，以防因河堤土方疏松而发生塌陷。</p><p>	<strong>　　9、会车时拉大横向间距。</strong></p><p>	　　雨天会车，来车往往因躲避积水而突然改变行驶路线，将车驶向路中，甚至于占用我方车道。鉴于这种情况，每遇会车，就要提前用加速踏板控速的方法，将车位调整到较为宽阔的路段进行交会。交会时的横向距离应尽量拉大，防止溅起的水花泼向对方，或因制动侧滑发生侧刮事故。11雨天行车注意休息。因雨中驾驶耗费精力，驾驶人容易疲劳，途中要适时安排休息，以恢复体力，保证路途安全。</p><p><br/></p>', '2017-05-23 22:00:01', '27', '0', '7');
INSERT INTO `article` VALUES ('16', '暴雨来袭如何停车避险', '<p><strong>　摘要：</strong>7月以来，四川西部、西北地区东部及华北等地出现暴雨，四川盆地西部局地特大暴雨。当车开到雨水积水处，车辆被淹，当自己遇到这种情况时该怎么办呢?本文是由找法网找法小编为您整理的暴雨来袭如何停车避险的相关知识。</p><p style=\"text-align: center\">	<a href=\"http://undefined\" target=\"_blank\"><img alt=\"交通安全知识\" src=\"http://img.findlawimg.com/info/2013/0715/20130715100355613.jpg\" style=\"width: 450px; height: 291px\" title=\"交通安全知识\"/></a></p><p>	　<strong>　一、行车遇险自救</strong></p><p>	　　1、车辆误入较深积水区,如水深超过排气管,应低挡行驶,提高引擎转速,稳定油门,保持行车速度,过水后,要留意制动性能是否有效。</p><p>	　　2、车辆进水熄火后,切勿试图启动发动机,应设法将车推到安全地带,避免影响其他车辆通行,第一时间报警求助。</p><p>	　　3、车辆掉入深水区域,切勿打开窗子或试图打开车门,请努力呼吸,找好准备逃生的门把手,等待水慢慢涌进车里,在水将要漫到车顶的时候,深吸一口气,然后屏气打开车门迅速游出。</p><p>	　　4、停车避险的时候,不要打开车内空调。</p><p>	　<strong>　二、避免入水,预防为主</strong></p><p>	　　1、当遇到不知深浅的积水时,不要急于通过,要绕行或者暂时不通过;</p><p>	　　2、遇到偏僻地方的桥梁和涵洞下方的积水时,建议不要通过,一旦陷入危机,很难及时得到救援;</p><p>	　<strong>　三、确定状况,平稳穿过</strong></p><p>	　　1、在熟悉的路段遇到积水,同时要了解自己车辆发动机的位置,当积水水位和自己车况全部掌握后,有把握通过时,要让车辆低速高转速平稳通过。</p><p>	　　2、涉水通过时,避免和公交车等大型车辆同行,以防大型客车推起水波,使自己车辆发动机进水。</p><p>	　<strong>　四、熄火自救,不要启动</strong></p><p>	　　1、在涉水通过时遇到车辆熄火,这时不要再次发动车辆,以免对发动机造成致命损害;</p><p>	　　2、此时应拨打“119”等待救援或者使用人机交互系统进行紧急呼叫;</p><p>	　　3、车辆被困时,应提前手动解除中控锁,提高必要情况下的逃生速度;</p><p>	　　4、将后备箱逃生拉手打开,以便遇到险情及时逃生。</p><p>	　<strong>　五、应急逃生,争分夺秒</strong></p><p>	　　1、当确定要逃生时,将车门打开一条缝或车窗打开一条缝,平衡车内外的水压差;</p><p>	　　2、在没有其它工具的情况下,利用车辆头枕可以敲开很多车辆的车窗;如果车上备有安全锤,它会很好的帮助你逃生。</p><p><br/></p>', '2017-05-23 22:01:23', '27', '0', '2');
INSERT INTO `article` VALUES ('17', '交通事故现场自救和互救常识', '<p><strong>摘要：乘客在车辆 (轮船、飞机) 发生险情或事故时，头脑要保持冷静，迅速判明情况，采取适当措施，切忌惊慌失措，这样才能够自救或者在自己脱离危险后去救助他人，这样才能将危险和损失降低到最低的程度。本文主要介绍了<a href=\"http://undefined\" target=\"_blank\" class=\"Key_word\">交通事故</a>现场自救和互救的知识，希望对您有所帮助。</strong></p><p>	　<strong>　一、飞机发生颠簸时</strong></p><p>	　　立即系好安全带。遇到紧急情况时，还应双手用力抓住前排座椅，身体紧紧压坐在椅子上，尽量弯下身体，低下头，防止摔伤；</p><p>	　　遇到紧急情况时，还应双手用力抓住前排座椅，身体紧紧压坐在椅子上，尽量弯下身体，低下头，防止摔伤。</p><p>	<strong>　　二、车辆遇险时</strong></p><p>	　　双手紧紧抓住前排座位或扶杆、把手，低下头，利用前排座椅靠背或两手臂保护头面部；</p><p>	　　若遇翻车或坠车时，迅速蹲下身体，紧紧抓住前排座位的座脚，身体尽量固定在两排座位之间，随车 翻转。</p><p>	　<strong>　三、轮船失火时</strong></p><p>	　　轮船失火时应听从指挥向上风方向有 序撤离。 撤离时，可用湿毛巾捂住口鼻，尽量弯腰、快跑，迅速远离火区。</p><p>	　<strong>　四、两船相撞时</strong></p><p>	　　当两船即将相撞时，应迅速离开碰撞处，避免挤压受伤；</p><p>	　　就近迅速拉住固定物，防止摔伤；</p><p>	　　需要弃船，听到沉船警报信号时(一分钟连续鸣七短声、一长声)，立即穿好救生衣，按各船舱中的紧急撤离 图示方向离船；</p><p>	　　听从指挥按次序登救生艇(筏)离船；</p><p>	　　只带贵重物品，不要带食物和行李；</p><p>	　　弃船后，应尽快远离船舶，防止下沉船舶造成漩涡，把人卷入。</p><p>	　<strong>　四、现场抢救应遵循的基本原则</strong></p><p>	　　<strong>1、先人后物：</strong>先抢救人员，后抢救财物；</p><p>	　<strong>　2、先重后轻：</strong>先抢救重伤人员，后抢救轻伤人员；</p><p>	<strong>　　3、先他人后自己：</strong>尤其是驾驶员、乘务员等要积极组织抢救乘客，不能只顾自己。</p><p>	<strong>　　五、抢救的基本顺序</strong></p><p>	　<strong>　1、现场呼救：</strong>利用附近的电话向公安、交通、医疗救护部门呼救。也可拦截过往车辆求救。就近向工矿企业、部队、机关等单位紧急求援；</p><p>	　<strong>　2、现场抢救：</strong>遇伤员被挤压、夹嵌在事故车辆内的，不要生拉硬拖，而应用机械拉开或切开车辆，再救出伤员。遇车辆压住伤员，不要轻易开动车辆，应用顶升工具(如千斤顶等)或者发动群众抬起车辆，再救出伤员；</p><p>	　<strong>　3、现场急救：</strong>伤员救出后，应对其进行必要的检查和急救，再转送医院。</p><p>	<strong>如果您还想了解更多关于<span style=\"color: rgb(255, 0, 0); \"><a href=\"http://undefined\" target=\"_blank\" class=\"Key_word\">交通安全知识</a></span>相关的知识，小编为您推荐：</strong></p><p>	<a href=\"http://undefined\"><span style=\"color: rgb(255, 0, 0); \"><strong>提高夜晚行车安全性四招</strong></span></a></p><p>	<a href=\"http://undefined\"><span style=\"color: rgb(255, 0, 0); \"><strong>儿童交通事故救援及相关自救知识</strong></span></a></p><p>	<a href=\"http://undefined\"><span style=\"color: rgb(255, 0, 0); \"><strong>女性安全驾驶须知</strong></span></a></p><p><br/></p>', '2017-05-23 22:03:42', '27', '0', '2');
INSERT INTO `article` VALUES ('18', '行人和非机动车交通行为规范', '<p><strong>行人交通行为规范</strong></p><p>	　　一、学习<a href=\"http://undefined\" target=\"_blank\" class=\"Key_word\">交通法规</a>，遵守交通法规，维护交通秩序，服从交通民警指挥。</p><p>	　　二、行人外出时，必须在人行道内行走，在没有人行道的地方要靠路边行走。</p><p>	　　三、横过马路必须走人行横道，过街天桥或地下通道，在设有人行横道信号灯的地方。</p><p>	　　四、严格遵守信号。在没有划人行横道的地方过马路时，要注意来往车辆，不要斜穿、猛跑。</p><p>	　　五、不要在道路上聚集打闹、追车、扒车、强行拦车、抛物砸车或进行其它有碍交通安全的活动。</p><p>	　　六、学龄儿童上街一定要有成年人带领。</p><p>	　　七、不得损毁和随意拆移交通设施，不得钻跨、倚坐交通护拦、隔离墩。</p><p>	　　八、列队在马路上行进，每横列不准超过2人。儿童的队列须在人行横道上行进，成年人的队列可以紧靠车行道右边行进。</p><p style=\"text-align: center;\">	<img alt=\"交通安全\" src=\"http://img.findlawimg.com/info/2015/1211/20151211032046975.jpg\" style=\"width: 480px; height: 300px;\"/></p><p>	<strong>　　骑车人交通行为规范</strong></p><p>	　　一、学习交通法规，遵守交通法规，维护交通秩序，服从交通民警指挥。</p><p>	　　二、车铃、车闸、车锁、车牌必须齐全有效。骑车上路，必须携带行车执照。</p><p>	　　三、未满十二周岁的儿童和醉酒的人不准在道路上骑车。</p><p>	　　四、各行其道，在没有快慢车道的路段，要靠右边行使。不准在人行道和快车道上行驶。</p><p>	　　五、骑车人要严格遵守交通信号，绿灯行红灯停，不闯红(黄)灯，不准越线停车。</p><p>	　　六、骑车不准逆行、斜穿、扶肩并行、双手撒把、互相追逐、曲折竞驶、攀扶其他车辆或手中持物，不准和机动车抢道。骑三轮车不准并驶。</p><p>	　　七、横穿四条以上机动车道或中途车闸失效时，要下车推行。</p><p>	　　八、转弯时要减速慢行，向后瞭望，伸手示意，不抢行猛拐。在有岗台的路口左转弯时要绕岗台。</p><p>	　　九、骑车不准带人。学龄前儿童经过十字路口时，要下车推行。载物不准超长、超宽、超高。</p><p>	　　十、要礼让礼宾警卫车队，不穿插礼宾警卫车队。</p><p>	　　十一、车辆停放时，须在停车场或准许停放车辆的地点依次有序停放。不准乱停乱放。</p><p>	　　十二、骑车与其他车辆、行人发生矛盾或<a href=\"http://undefined\" target=\"_blank\" class=\"Key_word\">交通事故</a>时，要文明礼貌，互相谦让、保护现场，并及时向公安交管部门报案。</p><p><br/></p>', '2017-05-23 22:05:42', '27', '0', '1');
INSERT INTO `article` VALUES ('19', '电动车9种违章安全规则', '<p><strong>导读：</strong>11月16日起，泉州交警将按照规章制度对市区违法交通规则的电动自行车进行严厉处罚。此次处罚涉及市区超标电动车无牌证上路、不规范挂牌、逆行、闯红灯、超载、酒驾等危害较大行为，在此小编总结九种不规范行车行为，以便市民清楚了解驾驶电动车中的相关违法交通规则行为。</p><p>	　<strong>　1、闯红灯</strong></p><p>	　　危险系数：非常危险</p><p>	　　惩罚措施：处50元罚款。</p><p>	　　警方提醒：在“闯红灯”过程中极易受到机动车的侵害。</p><p>	<strong>　　2、超载</strong></p><p>	<strong>　</strong>　危险系数：非常危险</p><p>	　　惩罚措施：处20元以上200元以下罚款</p><p>	　　警方提醒：超标电动自行车驾乘人员不得超过2人，即包含驾驶员超过2人算超载。</p><p>	<strong>　　3、酒驾醉驾毒驾</strong></p><p>	　　危险系数：极其危险</p><p>	　　惩罚手段：按照酒驾、醉驾机动车的有关处罚规定进行处理</p><p>	　　警方提醒：醉驾被查获，按涉嫌危险驾驶罪刑拘，可判处1个月以上6个月以下<a href=\"http://undefined\" target=\"_blank\" class=\"Key_word\">拘役</a>，所有准驾将吊销，5年内不得重新考取。</p><p>	　<strong>　4、未满18周岁</strong></p><p>	　　危险系数：危险</p><p>	　　惩罚手段：教育</p><p>	　　警方提醒：18岁以下的未成年人不可单独驾驶超标电动自行车，驾驶合标车需满16周岁。</p><p>	　<strong>　5、未按规定安装号牌</strong></p><p>	　　危险系数：危险</p><p>	　　惩罚手段：暂扣车辆并处20元罚款、核对相关手续、责令其按规定安装号牌后给予放行</p><p>	　　警方提醒：规范悬挂前后两个车牌，小牌在前，大牌在后，随身带行驶证、身份证。</p><p>	<strong>　　6、未悬挂车牌</strong></p><p>	　　(无牌或有牌未安装)</p><p>	　　危险系数：危险</p><p>	　　惩罚手段：暂扣车辆并处200元罚款、核对相关车辆来历凭证后给予放行</p><p>	　　警方提醒：造成电动车管理混乱，不利于打击偷车行为。</p><p>	　<strong>　7、逆向行驶</strong></p><p>	　　危险系数：非常危险</p><p>	　　惩罚措施：罚款100元</p><p>	　　警方提醒：主要是指在机动车道并逆行，车辆交汇时易发生碰撞，且与小车相比，电动车的驾驶员所受到的伤害肯定更大。</p><p>	　<strong>　8、 不戴安全帽</strong></p><p>	　　危险系数：极其危险</p><p>	　　惩罚手段：暂无规定</p><p>	　　警方提醒：超标电动自行车驾乘人员应按规定戴安全头盔。</p><p>	<strong>　　9、车速过快</strong></p><p>	　　危险系数：极其危险</p><p>	　　惩罚手段：暂无明文规定</p><p>	　　警方提醒：十次车祸九次快，一些“超标车”车速堪比摩托车，但制动性能差许多，遇到紧急情况难以及时刹车。</p><p>	<strong>　　安全小贴士：合标车5项行车要求</strong></p><p>	　　1.驾驶电动车(指合标)必须年满16周岁。</p><p>	　　2.电动车载物，高度从地面起不得超过1.5米，宽度左右都不得超出车把0.15米，长度前端不得超出车轮，后端不得超出车身0.3米。</p><p>	　　3.合标车上路，自觉杜绝无牌证上路、不按道行驶、在机动车道逆向行驶、闯红灯、超载、超速、酒驾、毒驾等危险驾驶行为。根据相关规定，非机动车(合标车)闯红灯、不服从交通指挥等可以处以20元罚款。</p><p>	　　4.在中心市区道路行驶的合标车须登记上牌，其他县(市、区)电动车(不论超不超标)也就不允许进入泉州市区行驶，市区车辆到县(市、区)也必须符合当地的相关规定，如果不符合自然也就无法上路。</p><p>	　　5.合标电动车属于非机动车，尚无硬性规定要戴头盔，安全起见，建议市民还是佩戴为好。</p><p><br/></p>', '2017-05-23 22:06:20', '27', '0', '1');
INSERT INTO `article` VALUES ('20', '交通规则知识大全', '<p><strong>摘要：</strong>本文主要介绍交通规则知识大全的知识。</p><p>	　　<strong>【目录】</strong></p><p>	<strong>　　<a href=\"http://undefined\">第一章 总 则</a></strong></p><p>	<strong>　　<a href=\"http://undefined\">第二章 车辆和驾驶人</a></strong></p><p>	<strong>　　<a href=\"http://undefined\">第三章 道路通行条件</a></strong></p><p>	<strong>　　<a href=\"http://undefined\">第四章 道路通行规定</a></strong></p><p>	<strong>　　<a href=\"http://undefined\">第五章 交通事故处理</a></strong></p><p>	<strong>　　【正文】</strong></p><p>	<strong>　　<a href=\"http://undefined\"></a>第一章 总 则</strong></p><p>	　　第一条 为了维护道路交通秩序，预防和减少交通事故，保护人身安全，保护公民、法人和其他组织的财产安全及其他合法权益，提高通行效率，制定本法。</p><p>	　　第二条 中华人民共和国境内的车辆驾驶人、行人、乘车人以及与道路交通活动有关的单位和个人，都应当遵守本法。</p><p>	　　第三条 道路交通安全工作，应当遵循依法管理、方便群众的原则，保障道路交通有序、安全、畅通。</p><p>	　　第四条 各级人民政府应当保障道路交通安全管理工作与经济建设和社会发展相适应。</p><p>	　　县级以上地方各级人民政府应当适应道路交通发展的需要，依据道路交通安全法律、法规和国家有关政策，制定道路交通安全管理规划，并组织实施。</p><p>	　　第五条 国务院公安部门负责全国道路交通安全管理工作。县级以上地方各级人民政府公安机关交通管理部门负责本行政区域内的道路交通安全管理工作。</p><p>	　　县级以上各级人民政府交通、建设管理部门依据各自职责，负责有关的道路交通工作。</p><p>	　　第六条 各级人民政府应当经常进行道路交通安全教育，提高公民的道路交通安全意识。</p><p>	　　公安机关交通管理部门及其交通警察执行职务时，应当加强道路交通安全法律、法规的宣传，并模范遵守道路交通安全法律、法规。</p><p>	　　机关、部队、企业事业单位、社会团体以及其他组织，应当对本单位的人员进行道路交通安全教育。</p><p>	　　教育行政部门、学校应当将道路交通安全教育纳入法制教育的内容。</p><p>	　　新闻、出版、广播、电视等有关单位，有进行道路交通安全教育的义务。</p><p>	　　第七条 对道路交通安全管理工作，应当加强科学研究，推广、使用先进的管理方法、技术、设备。</p><p>	　<strong>　<a href=\"http://undefined\"></a>第二章 车辆和驾驶人</strong></p><p>	<strong>　　第一节 机动车、非机动车</strong></p><p>	　　第八条 国家对机动车实行登记制度。机动车经公安机关交通管理部门登记后，方可上道路行驶。尚未登记的机动车，需要临时上道路行驶的，应当取得临时通行牌证。</p><p>	　　第九条 申请机动车登记，应当提交以下证明、凭证：</p><p>	　　(一)机动车所有人的身份证明;</p><p>	　　(二)机动车来历证明;</p><p>	　　(三)机动车整车出厂合格证明或者进口机动车进口凭证;</p><p>	　　(四)车辆购置税的完税证明或者免税凭证;</p><p>	　　(五)法律、行政法规规定应当在机动车登记时提交的其他证明、凭证。</p><p>	　　对符合前款规定条件的，公安机关交通管理部门应当自受理申请之日起五个工作日内完成机动车登记审查工作，发放机动车登记证书、号牌和行驶证;对不符合前款规定条件的，应当及时向申请人说明不予登记的理由。</p><p>	　　公安机关交通管理部门以外的任何单位或者个人不得发放机动车号牌或者要求机动车悬挂其他号牌，本法另有规定的除外。</p><p>	　　机动车登记证书、号牌、行驶证的式样由国务院公安部门规定并监制。</p><p>	　　第十条 准予登记的机动车应当符合机动车国家安全技术标准。申请机动车登记时，应当接受对该机动车的安全技术检验。但是，经国家机动车产品主管部门依据机动车国家 安全技术标准认定的企业生产的机动车型，该车型的新车在出厂时经检验符合机动车国家安全技术标准，获得检验合格证的，免予安全技术检验。</p><p>	　　第十一条 驾驶机动车上道路行驶，应当悬挂机动车号牌，放置检验合格标志、保险标志，并随车携带机动车行驶证。</p><p>	　　机动车号牌应当按照规定悬挂并保持清晰、完整，不得故意遮挡、污损。</p><p>	　　任何单位和个人不得收缴、扣留机动车号牌。</p><p>	　　第十二条 有下列情形之一的，应当办理相应的登记：</p><p>	　　(一) 机动车所有权发生转移的;</p><p>	　　(二) 机动车登记内容变更的;</p><p>	　　(三) 机动车用作抵押的;</p><p>	　　(四) 机动车报废的。</p><p>	　　第十三条 对登记后上道路行驶的机动车，应当依照法律、行政法规的规定，根据车辆用途、载客载货数量、使用年限等不同情况，定期进行安全技术检验。对提供机动车行驶证和机动车第三者责任强制保险单的，机动车安全技术检验机构应当予以检验，任何单位不得附加其他条件。对符合机动车国家安全技术标准的，公安机关交通管理部门应当发给检验合格标志。</p><p>	　　对机动车的安全技术检验实行社会化。具体办法由国务院规定。</p><p>	　　机动车安全技术检验实行社会化的地方，任何单位不得要求机动车到指定的场所进行检验。</p><p>	　　公安机关交通管理部门、机动车安全技术检验机构不得要求机动车到指定的场所进行维修、保养。</p><p>	　　机动车安全技术检验机构对机动车检验收取费用，应当严格执行国务院价格主管部门核定的收费标准。</p><p>	　　第十四条 国家实行机动车强制报废制度，根据机动车的安全技术状况和不同用途，规定不同的报废标准。</p><p>	　　应当报废的机动车必须及时办理注销登记。</p><p>	　　达到报废标准的机动车不得上道路行驶。报废的大型客、货车及其他营运车辆应当在公安机关交通管理部门的监督下解体。</p><p>	　　第十五条 警车、消防车、救护车、工程救险车应当按照规定喷涂标志图案，安装警报器、标志灯具。其他机动车不得喷涂、安装、使用上述车辆专用的或者与其相类似的标志图案、警报器或者标志灯具。</p><p>	　　警车、消防车、救护车、工程救险车应当严格按照规定的用途和条件使用。</p><p>	　　公路监督检查的专用车辆，应当依照公路法的规定，设置统一的标志和示警灯。</p><p>	　　第十六条 任何单位或者个人不得有下列行为：</p><p>	　　(一)拼装机动车或者擅自改变机动车已登记的结构、构造或者特征;</p><p>	　　(二)改变机动车型号、发动机号、车架号或者车辆识别代号;</p><p>	　　(三)伪造、变造或者使用伪造、变造的机动车登记证书、号牌、行驶证、检验合格标志、保险标志;</p><p>	　　(四)使用其他机动车的登记证书、号牌、行驶证、检验合格标志、保险标志。</p><p>	　　第十七条 国家实行机动车第三者责任强制保险制度，设立道路交通事故社会救助基金。具体办法由国务院规定。</p><p>	　　第十八条 依法应当登记的非机动车，经公安机关交通管理部门登记后，方可上道路行驶。</p><p>	　　依法应当登记的非机动车的种类，由省、自治区、直辖市人民政府根据当地实际情况规定。</p><p>	　　非机动车的外形尺寸、质量、制动器、车铃和夜间反光装置，应当符合非机动车安全技术标准。</p><p>	　<strong>　第二节 机动车驾驶人</strong></p><p>	　　第十九条 驾驶机动车，应当依法取得机动车驾驶证。</p><p>	　　申请机动车驾驶证，应当符合国务院公安部门规定的驾驶许可条件;经考试合格后，由公安机关交通管理部门发给相应类别的机动车驾驶证。</p><p>	　　持有境外机动车驾驶证的人，符合国务院公安部门规定的驾驶许可条件，经公安机关交通管理部门考核合格的，可以发给中国的机动车驾驶证。</p><p>	　　驾驶人应当按照驾驶证载明的准驾车型驾驶机动车;驾驶机动车时，应当随身携带机动车驾驶证。</p><p>	　　公安机关交通管理部门以外的任何单位或者个人，不得收缴、扣留机动车驾驶证。</p><p>	　　第二十条 机动车的驾驶培训实行社会化，由交通主管部门对驾驶培训学校、驾驶培训班实行资格管理，其中专门的拖拉机驾驶培训学校、驾驶培训班由农业(农业机械)主管部门实行资格管理。</p><p>	　　驾驶培训学校、驾驶培训班应当严格按照国家有关规定，对学员进行交通安全法律、法规、驾驶技能的培训，确保培训质量。</p><p>	　　任何国家机关以及驾驶培训和考试主管部门不得举办或者参与举办驾驶培训学校、驾驶培训班。</p><p>	　　第二十一条 驾驶人驾驶机动车上道路行驶前，应当对机动车的安全技术性能进行认真检查;不得驾驶安全设施不全或者机件不符合技术标准等具有安全隐患的机动车。</p><p>	　　第二十二条 机动车驾驶人应当遵守道路交通安全法律、法规的规定，按照操作规范安全驾驶、文明驾驶。</p><p>	　　饮酒、服用国家管制的精神药品或者麻醉药品，或者患有妨碍安全驾驶机动车的疾病，或者过度疲劳影响安全驾驶的，不得驾驶机动车。</p><p>	　　任何人不得强迫、指使、纵容驾驶人违反道路交通安全法律、法规和机动车安全驾驶要求驾驶机动车。</p><p>	　　第二十三条 公安机关交通管理部门依照法律、行政法规的规定，定期对机动车驾驶证实施审验。</p><p>	　　第二十四条 公安机关交通管理部门对机动车驾驶人违反道路交通安全法律、法规的行为，除依法给予行政处罚外，实行累积记分制度。公安机关交通管理部门对累积记分达到规定分值的机动车驾驶人，扣留机动车驾驶证，对其进行交通安全法律、法规教育，重新考试;考试合格的，发还其机动车驾驶证。</p><p>	　　对遵守道路交通安全法律、法规，在一年内无累积记分的机动车驾驶人，可以延长机动车驾驶证的审验期。具体办法由国务院公安部门规定。</p><p>	　<strong>　<a href=\"http://undefined\"></a>第三章 道路通行条件</strong></p><p>	　　第二十五条 全国实行统一的道路交通信号。</p><p>	　　道路交通信号包括交通信号灯、交通标志、交通标线和交通警察的指挥。</p><p>	　　交通信号灯、交通标志、交通标线的设置应当符合道路交通安全、畅通的要求和国家标准，并保持清晰、醒目、准确、完好。</p><p>	　　根据通行需要，应当及时增设、调换、更新交通信号。增设、调换、更新限制性的交通信号，应当提前向社会公告，广泛进行宣传。</p><p>	　　第二十六条 交通信号灯由红灯、绿灯、黄灯组成。红灯表示禁止通行，绿灯表示准许通行，黄灯表示警示。</p><p>	　　第二十七条 铁路与道路平面交叉的道口，应当设置警示灯、警示标志或者安全防护设施。无人看守的铁路道口，应当在距道口一定距离处设置警示标志。</p><p>	　　第二十八条 任何单位和个人不得擅自设置、移动、占用、损毁交通信号灯、交通标志、交通标线。</p><p>	　　道路两侧及隔离带上种植的树木或者其他植物，设置的广告牌、管线等，应当与交通设施保持必要的距离，不得遮挡路灯、交通信号灯、交通标志，不得妨碍安全视距，不得影响通行。</p><p>	　　第二十九条 道路、停车场和道路配套设施的规划、设计、建设，应当符合道路交通安全、畅通的要求，并根据交通需求及时调整。</p><p>	　　公安机关交通管理部门发现已经投入使用的道路存在交通事故频发路段，或者停车场、道路配套设施存在交通安全严重隐患的，应当及时向当地人民政府报告，并提出防范交通事故、消除隐患的建议，当地人民政府应当及时作出处理决定。</p><p>	　　第三十条 道路出现坍塌、坑漕、水毁、隆起等损毁或者交通信号灯、交通标志、交通标线等交通设施损毁、灭失的，道路、交通设施的养护部门或者管理部门应当设置警示标志并及时修复。</p><p>	　　公安机关交通管理部门发现前款情形，危及交通安全，尚未设置警示标志的，应当及时采取安全措施，疏导交通，并通知道路、交通设施的养护部门或者管理部门。</p><p>	　　第三十一条 未经许可，任何单位和个人不得占用道路从事非交通活动。</p><p>	　　第三十二条 因工程建设需要占用、挖掘道路，或者跨越、穿越道路架设、增设管线设施，应当事先征得道路主管部门的同意;影响交通安全的，还应当征得公安机关交通管理部门的同意。</p><p>	　　施工作业单位应当在经批准的路段和时间内施工作业，并在距离施工作业地点来车方向安全距离处设置明显的安全警示标志，采取防护措施;施工作业完毕，应当迅速清除道路上的障碍物，消除安全隐患，经道路主管部门和公安机关交通管理部门验收合格，符合通行要求后，方可恢复通行。</p><p>	　　对未中断交通的施工作业道路，公安机关交通管理部门应当加强交通安全监督检查，维护道路交通秩序。</p><p>	　　第三十三条 新建、改建、扩建的公共建筑、商业街区、居住区、大(中)型建筑等，应当配建、增建停车场;停车泊位不足的，应当及时改建或者扩建;投入使用的停车场不得擅自停止使用或者改作他用。</p><p>	　　在城市道路范围内，在不影响行人、车辆通行的情况下，政府有关部门可以施划停车泊位。</p><p>	　　第三十四条 学校、幼儿园、医院、养老院门前的道路没有行人过街设施的，应当施划人行横道线，设置提示标志。</p><p>	　　城市主要道路的人行道，应当按照规划设置盲道。盲道的设置应当符合国家标准。</p><p>	　<strong>　<a href=\"http://undefined\"></a>第四章 道路通行规定</strong></p><p>	<strong>　　第一节 一般规定</strong></p><p>	　　第三十五条 机动车、非机动车实行右侧通行。</p><p>	　　第三十六条 根据道路条件和通行需要，道路划分为机动车道、非机动车道和人行道的，机动车、非机动车、行人实行分道通行。没有划分机动车道、非机动车道和人行道的，机动车在道路中间通行，非机动车和行人在道路两侧通行。</p><p>	　　第三十七条 道路划设专用车道的，在专用车道内，只准许规定的车辆通行，其他车辆不得进入专用车道内行驶。</p><p>	　　第三十八条 车辆、行人应当按照交通信号通行;遇有交通警察现场指挥时，应当按照交通警察的指挥通行;在没有交通信号的道路上，应当在确保安全、畅通的原则下通行。</p><p>	　　第三十九条 公安机关交通管理部门根据道路和交通流量的具体情况，可以对机动车、非机动车、行人采取疏导、限制通行、禁止通行等措施。遇有大型群众性活动、大范围施工等情况，需要采取限制交通的措施，或者作出与公众的道路交通活动直接有关的决定，应当提前向社会公告。</p><p>	　　第四十条 遇有自然灾害、恶劣气象条件或者重大交通事故等严重影响交通安全的情形，采取其他措施难以保证交通安全时，公安机关交通管理部门可以实行交通管制。</p><p>	　　第四十一条 有关道路通行的其他具体规定，由国务院规定。</p><p>	<strong>　　第二节 机动车通行规定</strong></p><p>	　　第四十二条 机动车上道路行驶，不得超过限速标志标明的最高时速。在没有限速标志的路段，应当保持安全车速。</p><p>	　　夜间行驶或者在容易发生危险的路段行驶，以及遇有沙尘、冰雹、雨、雪、雾、结冰等气象条件时，应当降低行驶速度。</p><p>	　　第四十三条 同车道行驶的机动车，后车应当与前车保持足以采取紧急制动措施的安全距离。有下列情形之一的，不得超车：</p><p>	　　(一)前车正在左转弯、掉头、超车的;</p><p>	　　(二)与对面来车有会车可能的;</p><p>	　　(三)前车为执行紧急任务的警车、消防车、救护车、工程救险车的;</p><p>	　　(四)行经铁路道口、交叉路口、窄桥、弯道、陡坡、隧道、人行横道、市区交通流量大的路段等没有超车条件的。</p><p>	　　第四十四条 机动车通过交叉路口，应当按照交通信号灯、交通标志、交通标线或者交通警察的指挥通过;通过没有交通信号灯、交通标志、交通标线或者交通警察指挥的交叉路口时，应当减速慢行，并让行人和优先通行的车辆先行。</p><p>	　　第四十五条 机动车遇有前方车辆停车排队等候或者行驶缓慢时，不得借道超车或者占用对面车道，不得穿插等候的车辆。</p><p>	　　在车道减少的路段、路口，或者在没有交通信号灯、交通标志、交通标线或者交通警察指挥的交叉路口遇到停车排队等候或者缓慢行驶时，机动车应当依次交替通行。</p><p>	　　第四十六条 机动车通过铁路道口时，应当按照交通信号或者管理人员的指挥通行;在没有交通信号或者管理人员指挥时，应当减速或者停车，在确认安全后通过。</p><p>	　　第四十七条 机动车行经人行横道时，应当减速行驶; 遇行人正在通过人行横道，应当停车让行。</p><p>	　　机动车行经没有交通信号的道路时，遇有行人横过道路，应当避让。</p><p>	　　第四十八条 机动车载物应当符合核定的载质量，严禁超载;载物的长、宽、高不得违反装载要求，不得遗洒、飘散载运物。</p><p>	　　机动车运载超限的不可解体的物品，影响交通安全的，应当按照公安机关交通管理部门指定的时间、路线、速度行驶，悬挂明显标志。在公路上运载超限的不可解体的物品，并应当依照公路法的规定执行。</p><p>	　　机动车载运爆炸物品、易燃易爆化学物品以及剧毒、放射性等危险物品，应当经公安机关批准后，按指定的时间、路线、速度行驶，悬挂警示标志并采取必要的安全措施。</p><p>	　　第四十九条 机动车载人不得超过核定的人数，客运机动车不得违反规定载货。</p><p>	　　第五十条 禁止货运机动车载客。</p><p>	　　货运机动车需要附载作业人员的，应当设置保护作业人员的安全措施。</p><p>	　　第五十一条 机动车行驶时，驾驶人、乘坐人员应当按规定使用安全带，摩托车驾驶人及乘坐人员应当按规定戴安全头盔。</p><p>	　　第五十二条 机动车在道路上发生故障，需要停车排除故障时，驾驶人应当立即开启危险报警闪光灯，将机动车移至不妨碍交通的地方停放;难以移动的，应当持续开启危险报警闪光灯，并在来车方向设置警告标志等措施扩大示警距离，必要时迅速报警。</p><p>	　　第五十三条 警车、消防车、救护车、工程救险车执行紧急任务时，可以使用警报器、标志灯具;在确保安全的前提下，不受行驶路线、行驶方向、行驶速度和信号灯的限制，其他车辆和行人应当让行。</p><p>	　　警车、消防车、救护车、工程救险车非执行紧急任务时，不得使用警报器、标志灯具，不享有前款规定的道路通行优先权。</p><p>	　　第五十四条 道路养护车辆、工程作业车进行作业时，在不影响过往车辆通行的前提下，其行驶路线和方向不受交通标志、标线限制，过往车辆和人员应当注意避让。</p><p>	　　洒水车、清扫车等机动车应当按照安全作业标准作业;在不影响其他车辆通行的情况下，可以不受车辆分道行驶的限制，但是不得逆向行驶。</p><p>	　　第五十五条 高速公路、大中城市中心城区内的道路，禁止拖拉机通行。其他禁止拖拉机通行的道路，由省、自治区、直辖市人民政府根据当地的实际情况规定。</p><p>	　　在允许拖拉机通行的道路上，拖拉机可以从事货运，但不得用于载人。</p><p>	　　第五十六条 机动车应当在规定地点停放。禁止在人行道上停放机动车;但是，依照本法第三十三条规定施划的停车泊位除外。</p><p>	　　在道路上临时停车的，不得妨碍其他车辆和行人通行。</p><p>	　<strong>　第三节 非机动车通行规定</strong></p><p>	　　第五十七条 驾驶非机动车在道路上行驶应当遵守有关交通安全的规定。非机动车应当在非机动车道内行驶;在没有非机动车道的道路上，应当靠车行道的右侧行驶。</p><p>	　　第五十八条 残疾人机动轮椅车、电动自行车在非机动车道内行驶时，最高时速不得超过十五公里。</p><p>	　　第五十九条 非机动车应当在规定地点停放。未设停放地点的，非机动车停放不得妨碍其他车辆和行人通行。</p><p>	　　第六十条 驾驭畜力车，应当使用驯服的牲畜;驾驭畜力车横过道路时，驾驭人应当下车牵引牲畜;驾驭人离开车辆时，应当拴系牲畜。</p><p>	<strong>　　第四节 行人和乘车人通行规定</strong></p><p>	　　第六十一条 行人应当在人行道内行走，没有人行道的靠路边行走。</p><p>	　　第六十二条 行人通过路口或者横过道路，应当走人行横道或者过街设施;通过有交通信号灯的人行横道，应当按照交通信号灯指示通行;通过没有交通信号灯、人行横道的路口，或者在没有过街设施的路段横过道路，应当在确认安全后通过。</p><p>	　　第六十三条 行人不得跨越、倚坐道路隔离设施，不得扒车、强行拦车或者实施妨碍道路交通安全的其他行为。</p><p>	　　第六十四条 学龄前儿童以及不能辨认或者不能控制自己行为的精神疾病患者、智力障碍者在道路上通行，应当由其监护人、监护人委托的人或者对其负有管理、保护职责的人带领。</p><p>	　　盲人在道路上通行，应当使用盲杖或者采取其他导盲手段，车辆应当避让盲人。</p><p>	　　第六十五条 行人通过铁路道口，应当遵守铁路道口信号，服从管理人员的管理。没有铁路道口信号和管理人员的，应当在确认无火车驶临后，迅速通过。</p><p>	　　第六十六条 乘车人不得携带易燃易爆等危险物品，不得向车外抛洒物品，不得有影响驾驶人安全驾驶的行为，</p><p>	<strong>　　第五节 高速公路的特别规定</strong></p><p>	　　第六十七条 行人、非机动车、拖拉机、轮式专用机械车、铰接式客车、全挂拖斗车以及其他设计最高时速低于七十公里的机动车，不得进入高速公路。高速公路限速标志标明的最高时速不得超过一百二十公里。</p><p>	　　第六十八条 机动车在高速公路上发生故障时，应当依照本法第五十二条的有关规定办理;但是，警告标志应当设置在故障车来车方向一百五十米以外，车上人员应当迅速转移到右侧路肩上或者应急车道内，并且迅速报警。</p><p>	　　机动车在高速公路上发生故障或者交通事故，无法正常行驶的，应当由救援车、清障车拖曳、牵引。</p><p>	　　第六十九条 任何单位、个人不得在高速公路上拦截检查行驶的车辆，公安机关的人民警察依法执行紧急公务除外。</p><p>	　<strong>　<a href=\"http://undefined\"></a>第五章 交通事故处理</strong></p><p>	　　第七十条 在道路上发生交通事故，车辆驾驶人应当立即停车，保护现场;造成人员伤亡的，车辆驾驶人应当立即抢救受伤人员，并迅速报告执勤的交通警察或者公安机关交通管理部门。因抢救受伤人员变动现场的，应当标明位置。乘车人、过往车辆驾驶人、过往行人应当予以协助。</p><p>	　　在道路上发生交通事故，未造成人员伤亡，当事人对事实及成因无争议的，可以即行撤离现场，恢复交通，自行协商处理损害赔偿事宜;不即行撤离现场的，应当迅速报告执勤的交通警察或者公安机关交通管理部门。</p><p>	　　在道路上发生交通事故，仅造成轻微财产损失，并且基本事实清楚的，当事人应当先撤离现场再进行协商处理。</p><p>	　　第七十一条 车辆发生交通事故后逃逸的，事故现场目击人员和其他知情人员应当向公安机关交通管理部门或者交通警察举报。举报属实的，公安机关交通管理部门应当给予奖励。</p><p>	　　第七十二条 公安机关交通管理部门接到道路交通事故报警后，应当立即派交通警察赶赴现场，先组织抢救受伤人员，并采取措施，尽快恢复交通。</p><p>	　　交通警察应当对交通事故现场进行勘验、检查，收集证据;因收集证据的需要，可以扣留事故车辆，但是应当妥善保管，以备核查。</p><p><br/></p>', '2017-05-23 22:07:28', '27', '0', '3');
INSERT INTO `article` VALUES ('22', '开了那么多年车，今天才第一回看懂交规！ ', '<p style=\"border: 0px; margin: 0px; padding: 10px 0px 20px; font-size: 16px; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\">导读</p><p style=\"border: 0px; margin: 0px; padding: 10px 0px 20px; font-size: 16px; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\">如果你开了很多的年车却从来没有违章，那么你已经超过了90%的司机。然而还有10%的优秀司机，你可能很难超越。也许你会问：这10%的司机他们牛在哪？看看下面这条冷门交规，这也许就是你和优秀司机之间的差距……</p><h3 style=\"border: 0px; margin: 0px; padding: 10px 0px 20px; font-size: 16px; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><strong><em><span style=\"color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">01究竟什么才是右侧超<strong><strong></strong></strong>车</span></em></strong></h3><p><img src=\"http://windows10.microdone.cn:8080/gltraffic/adminsystem/umeditor/jsp/upload/20170602/95851496383143374.jpg\" style=\"\"/></p><p style=\"border: 0px; margin: 0px; padding: 10px 0px 20px; font-size: 16px; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\">第一种：</p><p style=\"border: 0px; margin: 0px; padding: 10px 0px 20px; font-size: 16px; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\">右侧车道的车超越左侧车道的车。</p><p><img src=\"http://windows10.microdone.cn:8080/gltraffic/adminsystem/umeditor/jsp/upload/20170602/22941496383144978.jpg\" style=\"\"/></p><p style=\"border: 0px; margin: 0px; padding: 10px 0px 20px; font-size: 16px; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\">第二种：</p><p style=\"border: 0px; margin: 0px; padding: 10px 0px 20px; font-size: 16px; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\">右侧车道的车超越左侧车道的车，并到左侧车道。</p><p><img src=\"http://windows10.microdone.cn:8080/gltraffic/adminsystem/umeditor/jsp/upload/20170602/41161496383146321.jpg\" style=\"\"/></p><p style=\"border: 0px; margin: 0px; padding: 10px 0px 20px; font-size: 16px; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\">第三种：</p><p style=\"border: 0px; margin: 0px; padding: 10px 0px 20px; font-size: 16px; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\">同一车道的后车并到右侧车道，超越前车。</p><p style=\"border: 0px; margin: 0px; padding: 10px 0px 20px; font-size: 16px; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\"><br/></p><p style=\"border: 0px; margin: 0px; padding: 10px 0px 20px; font-size: 16px; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\">不知道的人可能就会想当然的以为从右边超车的都叫右侧超车，其实以上三种情况都不属于右侧超车，真正的右侧超车是指同一车道的后车并到右侧车道，超越前车再回到原车道。</p><p style=\"border: 0px; margin: 0px; padding: 10px 0px 20px; font-size: 16px; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\">02右侧超车为什么不可以？</p><p style=\"border: 0px; margin: 0px; padding: 10px 0px 20px; font-size: 16px; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\">在我国为什么不能右侧超车？首先我国的车辆都是左舵车，而且是靠右行驶，这就导致右侧的视线没有左侧好，右侧车道前方有意外情况也是观察不到的，其次右侧反光镜的盲区也比左侧要多，很容易发生事故。</p><p style=\"border: 0px; margin: 0px; padding: 10px 0px 20px; font-size: 16px; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\">03怎么样才能正常超车</p><p><img src=\"http://windows10.microdone.cn:8080/gltraffic/adminsystem/umeditor/jsp/upload/20170602/60241496383147746.jpg\" style=\"\"/></p><p style=\"border: 0px; margin: 0px; padding: 10px 0px 20px; font-size: 16px; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\">正确的超车步骤应该是后车先并线到左侧车道，加速超过前车后在快速回到原车道，当然这个过程中一定要注意观察。</p><p style=\"border: 0px; margin: 0px; padding: 10px 0px 20px; font-size: 16px; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\">04追尾一定是后车的责任吗?</p><p><img src=\"http://windows10.microdone.cn:8080/gltraffic/adminsystem/umeditor/jsp/upload/20170602/43741496383149034.jpg\" style=\"\"/></p><p style=\"border: 0px; margin: 0px; padding: 10px 0px 20px; font-size: 16px; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\">在一般人的理解中，一说到追尾就会判定是后车的责任，后车没有保持车距等，其实在有些情况下，追尾也可能是前车的责任，比如前车压线行驶或紧急并线 时发生追尾，这种情况由前车承担责任;前方车辆在掉头的过程中与直行车辆发生碰撞或追尾的，由前车承担责任，参考的是交通法规关于“相对方向同类车相遇， 左转弯避让直行或右转弯车辆”的规定。</p><p style=\"border: 0px; margin: 0px; padding: 10px 0px 20px; font-size: 16px; color: rgb(25, 25, 25); font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\">值得一提的是，如果前车处于静止状态被追尾，那肯定还是后车的责任。</p><p><br/></p><p><br/></p>', '2017-06-02 14:02:52', '27', '0', '7');
INSERT INTO `article` VALUES ('23', '2017最新交规细则及扣分标准公布', '<p style=\"line-height: 25.6px;\">2017年最新交规公布出来了。小当也是第一时间为各位商家朋友们整理了最新的细则及扣分标准。新的交规首次将校车列入了扣分的行列中。对于各种违章行为，处罚力度最严重的直接扣12分。另外相比2015-2016年的旧版本交规，新版本中，许多的违规行为由以前的扣6分直接升级为扣12分。</p><p style=\"line-height: 25.6px;\"><img src=\"http://windows10.microdone.cn:8080/gltraffic/adminsystem/umeditor/jsp/upload/20170602/11961496384197830.jpeg\"/></p><p style=\"text-align: center;\"><br/></p><p class=\"yead_bdtc yead_bdbc\" style=\"border-radius: 10px; padding: 8px 23px; color: rgb(34, 34, 34); font-size: 16px; display: inline-block; border-top-width: 5px; border-top-style: solid; border-top-color: rgb(234, 134, 134); border-bottom-width: 5px; border-bottom-style: solid; border-bottom-color: rgb(234, 134, 134);\">新交规扣12分的违章行为</p><p style=\"line-height: 25.6px;\">1、驾驶营运客车超载20％以上（将校车列入其中）	</p><p style=\"line-height: 25.6px;\">在明年，营运车辆超载20%以上的车辆将受到扣除12分的处罚，其中除了出租车、长途客运车辆等常规营运车辆外（不含公交车），在新规则中还首次加入了校车。</p><p style=\"line-height: 25.6px;\">2、严重超速（新规定加入校车）	</p><p style=\"line-height: 25.6px;\">驾驶中型以上载客载货汽车、校车、危险物品运输车辆在高速公路、城市快速路上行驶超过规定时速20％以上或者在高速公路、城市快速路以外的道路上行驶超过规定时速50％以上，以及驾驶其他机动车行驶超过规定时速50%以上。</p><p style=\"line-height: 25.6px;\">3、故意遮挡号牌（由扣6分调整为扣12分）	</p><p style=\"line-height: 25.6px;\">对于之前有过故意摘掉车牌、遮挡号牌的驾驶者要注意了：从1月1日起，上道路行驶的机动车未悬挂机动车号牌的，或者故意遮挡、污损、不按规定安装机动车号牌一律会被一次性扣除12分。另外，对于牌照架也更新了规定，对于使用不符合规定的牌照架会受到200元并扣6分的处罚。</p><p style=\"line-height: 25.6px;\">4、驾驶营运客车在高速公路车道内停车（由扣6分调整为扣12分）	</p><p style=\"line-height: 25.6px;\">在高速公路上停车是十分危险的做法，此次更新对于营运长途客车在高速公路上停车上下乘客的行为加大了处罚力度，如果营运客车在高速公路上擅自停车（没有事故、车辆故障等原因）将受到一次性扣除12分的处罚。</p><p style=\"line-height: 25.6px;\">5、连续驾驶中型以上载客汽车、危险物品运输车辆超过4小时未停车休息或者停车休息时间少于20分钟（由扣6分调整为扣12分）	</p><p style=\"line-height: 25.6px;\">6、未取得校车驾驶资格驾驶校车（新增）	</p><p style=\"line-height: 25.6px;\">由于近年来关于校车的规定越来越完善，在新扣分规则中也将关于校车的处罚力度提升。</p><p style=\"line-height: 25.6px;\">校车准驾驾驶资格：1、驾龄3年以上，年龄不超过60周岁；2、最近连续3个分周期内没有满分记录；3、无致人死亡或者重伤的交通责任事故；4、无饮酒或者醉酒后驾驶记录，最近1年内无驾驶客运车辆超员、超速等严重交通违法行为；5、无犯罪记录，无因违反治安管理行为受到拘留处罚的记录；6、身体健康，无酗酒、吸毒行为记录，无传染性疾病，无癫痫、精神病等可能危及行车安全的病史。</p><p style=\"line-height: 25.6px;\">7、饮酒后驾驶机动车	</p><p style=\"line-height: 25.6px;\">酒后驾车可以说是最最严重的，对于酒后驾车除了扣除12分之外，还将扣押驾照6个月，并给予不超过2000元的现金处罚。对于醉酒驾车则是吊销驾驶证的处罚，除此之外还有刑事责任的处罚，且5年内不得重新考取驾照。</p><p style=\"line-height: 25.6px;\">8、驾驶与准驾车型不符</p><p style=\"line-height: 25.6px;\">如果您驾驶了比获取驾照的级别要高的车辆，比如准驾车型是C1（小客车），但开了B1的车辆（中型客车），那么将会受到12分的处罚。这的确是非常严重的违章行为，实际上讲越级驾驶可以视为无照驾驶。另外除了扣除12分之外，交警还有权利给予200-2000元和扣车等处罚。</p><p style=\"line-height: 25.6px;\">9、造成交通事故后逃逸	</p><p style=\"line-height: 25.6px;\">交通事故肇事逃逸，尚不构成犯罪者将会受到12分的处罚，当然也要承担相应的民事责任。如果因而发生重大事故，致人重伤、死亡或者使公私财产遭受重大损失的，处三年以下有期徒刑或者拘役；交通运输肇事后逃逸或者有其他特别恶劣情节的，处三年以上七年以下有期徒刑；因逃逸致人死亡的，处七年以上有期徒刑。</p><p style=\"line-height: 25.6px;\">10、伪造、更改号牌和证件	</p><p style=\"line-height: 25.6px;\">对于使用伪造、擅自更改的机动车号牌、行驶证、驾驶证、校车标牌，或者使用其他机动车号牌、行驶证等行为将会一次性扣除12分。	</p><p style=\"line-height: 25.6px;\">11、驾驶机动车在高速公路上倒车、逆行、穿越中央分隔带掉头</p><p style=\"line-height: 25.6px;\">高速公路是绝对的危险路段，由于高速公路是全封闭的设计，所以您在高速路上只能是向前跑，出现停车、倒车甚至是逆行和借助中央隔离带的缺口掉头等行为，都是严重影响交通安全的，以上行为都会受到12分的处罚。</p><p style=\"line-height: 25.6px;\">除了原来的6项之外有增加了5项，部分为6分的处罚规定升级的12分，针对我国的情况来看，有助于更好地把控违章行为，安全意识不够高也只能用提高处罚的力度来维护交通环境了。</p><p style=\"line-height: 25.6px;\">一次性扣除12分是最严厉的处罚了，被处罚者将被扣留机动车驾驶证，之后按照规定参加道路交通安全法律、法规的学习并接受考试，考试合格者记分予以清除，发还机动车驾驶证；考试不合格的，继续参加学习和考试。</p><p style=\"text-align: center;\"><br/></p><p><br/></p><p class=\"yead_bdtc yead_bdbc\" style=\"border-radius: 10px; padding: 8px 23px; color: rgb(34, 34, 34); font-size: 16px; display: inline-block; border-top-width: 5px; border-top-style: solid; border-top-color: rgb(234, 134, 134); border-bottom-width: 5px; border-bottom-style: solid; border-bottom-color: rgb(234, 134, 134);\">新交规扣6分的违章行为</p><p style=\"line-height: 25.6px;\">1、驾驶机动车违反道路交通信号灯通行（由扣3分调整为扣6分）</p><p style=\"line-height: 25.6px;\">这一条主要说的是由于侥幸心理导致的闯红灯行为，过去是扣除3分，从2017年开始升级为扣除6分。另外小当友情提醒：无论白天还是晚上、车多还是车少，我们要牢记，珍爱生命，真的不急那几秒钟的时间。遵守交通规则，是每个公民应尽的责任。</p><p style=\"line-height: 25.6px;\">2、货车超载（由扣3分调整为扣6分）	</p><p style=\"line-height: 25.6px;\">驾驶货车载物超过额定载重量30%以上的车辆，或违反规定载客的车辆将受到扣除6分的处罚。	</p><p style=\"line-height: 25.6px;\">3、营运车辆超载未超过20%（由扣2分调整为扣6分）</p><p style=\"line-height: 25.6px;\">驾驶营运客车（不包括公共汽车）、校车载人超过核定人数未达20％的，或者驾驶其他载客汽车载人超过核定人数20％以上将受到扣除6分的处罚。	</p><p style=\"line-height: 25.6px;\">4、高速公路超速未达到20%（新增）	</p><p style=\"line-height: 25.6px;\">驾驶中型以上载客载货汽车、校车、危险物品运输车辆在高速公路、城市快速路上行驶超过规定时速未达20%的车辆将受到扣除6分的处罚。	</p><p style=\"line-height: 25.6px;\">5、普通公路超速20%以上（新增）	</p><p style=\"line-height: 25.6px;\">驾驶中型以上载客载货汽车、校车、危险物品运输车辆在高速公路、城市快速路以外的道路上行驶或者驾驶其他机动车行驶超过规定时速20%以上未达到50%将受到此处罚。</p><p style=\"line-height: 25.6px;\">6、驾驶机动车不按照规定避让校车（新增）	</p><p style=\"line-height: 25.6px;\">关于校车的规定是新驾照规范中的重点。我国的校车意识可以说是刚刚起步，所以在这个阶段，我们应该更多的给予支持和鼓励，如果看到校车，我们一定要主动避让，孩子是弱者也是未来，给他们提供尽可能多安全的交通环境吧。</p><p style=\"line-height: 25.6px;\">7、低能见度气象条件下驾驶机动车在高速公路上不按规定行驶（新增）	</p><p style=\"line-height: 25.6px;\">在恶劣天气中，应该做到：1、能见度小于200米时，开启雾灯、近光灯、示廓灯和前后雾灯，车速不得超过每小时60公里，与同车道前车保持100米以上的距离；2、能见度小于100米时，开启雾灯、近光灯、示廓灯、前后雾灯和危险报警闪光灯，车速不得超过每小时40公里，与同车道前车保持50米以上的距离；3、能见度小于50米时，开启雾灯、近光灯、示廓灯、前后雾灯和危险报警闪光灯，车速不得超过每小时20公里，并从最近的出口尽快驶离高速公路。如果没有做到以上三条，将受到6分的处罚。</p><p style=\"line-height: 25.6px;\">8、机动车驾驶证被暂扣期间驾驶机动车	</p><p style=\"line-height: 25.6px;\">由于违章被暂扣驾照期间的朋友千万不要抱着侥幸心理再次驾车上路，虽然技术上与有无驾照无关，但是这也是非常严重的违规行为，不夸张的说在此期间属于无照驾驶。</p><p style=\"line-height: 25.6px;\">9、驾驶营运客车以外的机动车在高速公路车道内停车	</p><p style=\"line-height: 25.6px;\">非营运车辆在高速公路上停车将受到扣除6分的处罚。在这里小当要提醒各位商家们，高速公路是全封闭的，在这种路段只有向前跑是对的，如果车辆发生问题，事故或者故障，那么应该及时打开双闪，然后减速并线到外侧车道，待遇到港湾或者安全地带再停车，否则会给其他社会车辆造成很大的造成危险。</p><p style=\"line-height: 25.6px;\">10、占用应急车道	</p><p style=\"line-height: 25.6px;\">驾驶机动车在高速公路或者城市快速路上违法占用应急车道行驶，给予扣除6分的处罚。在这里小当还要提醒商家朋友们，应急车道是用来应急的，方便社会车辆在“抛锚”和处理事故时停靠，以及让救护车、消防车都够及时通过。</p><p style=\"line-height: 25.6px;\">11、运载特殊物品不挂相应警告标志	</p><p style=\"line-height: 25.6px;\">驾驶机动车运载超限的不可解体的物品，未按指定的时间、路线、速度行驶或者未悬挂明显标志者，将受到扣除6分的处罚。	</p><p style=\"line-height: 25.6px;\">12、运输危险品</p><p style=\"line-height: 25.6px;\">驾驶机动车载运爆炸物品、易燃易爆化学物品以及剧毒、放射性等危险物品，未按指定的时间、路线、速度行驶或者未悬挂警示标志并采取必要的安全措施者将受到此处罚。</p><p style=\"line-height: 25.6px;\">13、以隐瞒、欺骗手段补领机动车驾驶证	</p><p style=\"line-height: 25.6px;\">如果驾驶证没有丢失，擅自以欺骗方式补领也将受到6分的处罚。这条规定主要是为了防止在被扣押机动车驾驶证期间骗取新的驾照代替上路。</p><p style=\"line-height: 25.6px;\">14、未按照规定休息	</p><p style=\"line-height: 25.6px;\">连续驾驶中型以上载客汽车、危险物品运输车辆以外的机动车超过4小时未停车休息或者停车休息时间少于20分钟者将受到扣除6分的处罚。	</p><p style=\"text-align: center;\"><br/></p><p><br/></p><p class=\"yead_bdtc yead_bdbc\" style=\"border-radius: 10px; padding: 8px 23px; color: rgb(34, 34, 34); font-size: 16px; display: inline-block; border-top-width: 5px; border-top-style: solid; border-top-color: rgb(234, 134, 134); border-bottom-width: 5px; border-bottom-style: solid; border-bottom-color: rgb(234, 134, 134);\">新交规扣3分的违章行为</p><p><img class=\"wx-img\" style=\"width:90px;height:90px;color:inherit\" src=\"http://img.igeek.com.cn/uploads/2016/11/09/2de49eba13bdb127d52e47d6b90f55b0.png\" title=\"文章图片7\" alt=\"文章图片7\"/></p><p style=\"line-height: 25.6px;\">1、驾驶机动车在高速公路或者城市快速路上不按规定车道行驶（新增）	</p><p style=\"line-height: 25.6px;\">国内多数高速公路都对小型车和大型车的行驶车道进行了规定，小型车在内侧快速车道行驶，大型车在外侧慢速车道行驶。从明年开始在高速公路或城市快速路上不按照规定车道将受到扣除3分的处罚。</p><p style=\"line-height: 25.6px;\">2、超速20%以下（新增）	</p><p style=\"line-height: 25.6px;\">驾驶中型以上载客载货汽车、危险物品运输车辆在高速公路、城市快速路以外的道路上行驶超过规定时速未达20%、驾驶其他机动车行驶超过规定时速未达20%均受到扣除3分的处罚。</p><p style=\"line-height: 25.6px;\">3、驾驶机动车行经人行横道，不按规定减速、停车、避让行人（由扣2分调整为扣3分）</p><p style=\"line-height: 25.6px;\">这条规定由过去的扣2分提升为扣3分，不过对于避让行人这事儿，这扣分真的不是目的，要提高我国的交通环境和行车素质是要凭我们的主动和自觉。</p><p style=\"line-height: 25.6px;\">4、驾驶营运客车（不含公交车）、校车以外的载客汽车载人超过核定人数未达20%（由扣2分调整为扣3分）	</p><p style=\"line-height: 25.6px;\">5、驾驶货车载物超过核定载质量未达30%（由扣2分调整为扣3分）	</p><p style=\"line-height: 25.6px;\">6、驾驶机动车在高速公路上行驶低于规定最低时速	</p><p style=\"line-height: 25.6px;\">违反高速公路的规定速度除了超速之外，还有最低时速的限制，一般来说最外侧车道的最低限速是80公里/时，中间车道和内侧车道的最低限速普遍为90公里/时或100公里/时。在高速公路上，如果您的车速过于慢的话是非常不安全的，如果为此遭到后车追尾，前车也是有责任的。</p><p style=\"line-height: 25.6px;\">7、驾驶禁止驶入高速公路的机动车驶入高速公路	</p><p style=\"line-height: 25.6px;\">8、驾驶机动车违反禁令标志、禁止标线指示	</p><p style=\"line-height: 25.6px;\">9、驾驶机动车不按规定超车、让行的，或者逆向行驶	</p><p style=\"line-height: 25.6px;\">在山路和乡村等比较狭窄的道路上，一定要按照地上的标线行驶，如果违章超车是很危险的。遇到狭窄路口合理让行对方，比如路的一侧有障碍物，如果你优先通过障碍物则应该得到对方的避让，如果对方已经通过障碍物，您就应该避让对方，而不应该继续抢行，否则会受到扣除3分的处罚。同时在除高速公路、城市快速路以外的道路上逆行，也将受到此处罚。</p><p style=\"line-height: 25.6px;\">10、驾驶机动车违反规定牵引挂车	</p><p style=\"line-height: 25.6px;\">机动车牵引挂车应当符合下列规定：1、载货汽车、半挂牵引车、拖拉机只允许牵引1辆挂车。挂车的灯光信号。制动、连接、安全防护等装置应当符合国家标准；2、小型载客汽车只允许牵引旅居挂车或者总质量700千克以下的挂车。挂车不得载人；3、载货汽车所牵引挂车的载质量不得超过载货汽车本身的载质量；4、大型、中型载客汽车、低速载货汽车、三轮汽车以及其他机动车不得牵引挂车。违反以上规则将受到扣除3分的处罚。</p><p style=\"line-height: 25.6px;\">11、在道路上车辆发生故障、事故停车后，不按规定使用灯光和设置警告标志</p><p style=\"line-height: 25.6px;\">12、上道路行驶的机动车未按规定定期进行安全技术检验	</p><p style=\"line-height: 25.6px;\">这段话说的有点复杂，其实就是年检，在这里没有什么太好的方法，只能是您自己记清楚爱车的年检日期，在到期前尽快办理，以免承受这样不必要的处罚，很冤枉。另外，在年检之前，记得查一下保险是否到期，如果保险到期了是无法通过年检的，需要续保才可以顺利进行。</p><p class=\"yead_bdtc yead_bdbc\" style=\"border-radius: 10px; padding: 8px 23px; color: rgb(34, 34, 34); font-size: 16px; display: inline-block; border-top-width: 5px; border-top-style: solid; border-top-color: rgb(234, 134, 134); border-bottom-width: 5px; border-bottom-style: solid; border-bottom-color: rgb(234, 134, 134);\">新交规扣2分的违章行为</p><p style=\"line-height: 25.6px;\">1、驾驶机动车行经交叉路口不按规定行车或者停车	</p><p style=\"line-height: 25.6px;\">十字路口是比较繁忙的地点，在这里不按照规定行驶或乱停车势必会给正常交通带来不利影响。另外，在交叉路口附近乱停车也将受到扣除2分的处罚。	</p><p style=\"line-height: 25.6px;\">2、驾驶机动车有拨打、接听手持电话等妨碍安全驾驶的行为	</p><p style=\"line-height: 25.6px;\">在驾车中打电话十分分散注意力，虽然这条在新规定中没有变化，但是在明年对于这种经常被人唾骂的行为，会有更加严格的监管，在这里小当也要提醒商家们，开车的时候尽量不要打电话，或者佩戴蓝牙耳机，对自己和他人的生命安全负责。</p><p style=\"line-height: 25.6px;\">3、驾驶二轮摩托车，不戴安全头盔	</p><p style=\"line-height: 25.6px;\">4、未系安全带	</p><p style=\"line-height: 25.6px;\">驾驶机动车在高速公路或者城市快速路上行驶时，驾驶人未按规定系安全带者将受到此处罚。小当再次友情提醒下，安全带是车辆上最重要的被动安全装备，应该是驾驶员除了停车外的任何时候都要系好的，而不是只是在高速公路上才需要系好。</p><p style=\"line-height: 25.6px;\">5、“加塞”行为扣2分	</p><p style=\"line-height: 25.6px;\">驾驶机动车遇前方机动车停车排队或者缓慢行驶时，借道超车或者占用对面车道、穿插等候车辆将受到扣除2分的处罚。	</p><p style=\"line-height: 25.6px;\">6、不按照规定为校车配备安全设备，或者不按照规定对校车进行安全维护。	</p><p style=\"line-height: 25.6px;\">7、驾驶校车运载学生，不按照规定放置校车标牌、开启校车标志灯，或者不按照经审核确定的线路行驶。	</p><p style=\"line-height: 25.6px;\">8、校车上下学生，不按照规定在校车停靠站点停靠。	</p><p style=\"line-height: 25.6px;\">9、校车未运载学生上道路行驶，使用校车标牌、校车标志灯和停车指示标志。	</p><p style=\"line-height: 25.6px;\">10、驾驶校车上道路行驶前，未对校车车况是否符合安全技术要求进行检查，或者驾驶存在安全隐患的校车上道路行驶。	</p><p style=\"line-height: 25.6px;\">11、在校车载有学生时给车辆加油，或者在校车发动机引擎熄灭前离开驾驶座位。	</p><p style=\"text-align: center;\"><br/></p><p><br/></p><p class=\"yead_bdtc yead_bdbc\" style=\"border-radius: 10px; padding: 8px 23px; color: rgb(34, 34, 34); font-size: 16px; display: inline-block; border-top-width: 5px; border-top-style: solid; border-top-color: rgb(234, 134, 134); border-bottom-width: 5px; border-bottom-style: solid; border-bottom-color: rgb(234, 134, 134);\">新交规扣1分的违章行为</p><p><img class=\"wx-img\" style=\"width: 60px;\" src=\"http://img.igeek.com.cn/uploads/2016/11/09/aeb96912af4905474d91f1bee12a2538.jpeg\" title=\"文章图片12\" alt=\"文章图片12\"/></p><p style=\"line-height: 25.6px;\">1、驾驶机动车不按规定使用灯光</p><p style=\"line-height: 25.6px;\">这其中包括了夜晚不开车灯、不正确使用远光灯、不正确使用雾灯等严重影响自己和其他车辆行驶安全的行为。	</p><p style=\"line-height: 25.6px;\">2、驾驶机动车不按规定会车	</p><p style=\"line-height: 25.6px;\">会车时，必须注意保持足够的安全侧向间距，做到“礼让三先”——先慢、先让、先停，绝对不可抢行争路，互不相让，以致形成僵持局面。一般情况下的会车，须遵守下列规则：空车让重车，单车让拖挂货车，大车让小车，货车让客车，教练车让其他车辆，普通车让执行任务的特种车，下坡车让上坡车。</p><p style=\"line-height: 25.6px;\">3、驾驶机动车载货长度、宽度、高度超过规定	</p><p style=\"line-height: 25.6px;\">不仅是货车，家用车也会出现此违章的问题。比如用家用车顶着一个双人床床垫、后备厢拉一个大尺寸的货物造成盖不上后备厢盖等都是违章行为。	</p><p style=\"line-height: 25.6px;\">4、上道路行驶的机动车未放置检验合格标志、保险标志，未随车携带行驶证、机动车驾驶证的。	</p><p>最后小当希望各位车友、各位商家们要自觉按交通法规办事，千万不要有侥幸心理。每位驾驶人都应该珍惜你的12分，做一个遵纪守法的开车人。</p><p><br/></p>', '2017-06-02 14:24:23', '27', '0', '7');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_topic_id` int(11) DEFAULT NULL,
  `comment_from_id` int(11) DEFAULT NULL,
  `comment_content` text,
  `comment_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `comment_quote_comment` int(11) DEFAULT NULL,
  `comment_state` tinyint(4) DEFAULT NULL,
  `comment_state_quote` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_topic_id` (`comment_topic_id`),
  KEY `fk_from_id` (`comment_from_id`),
  KEY `comment_quote_comment` (`comment_quote_comment`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`comment_quote_comment`) REFERENCES `comment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_from_id` FOREIGN KEY (`comment_from_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_topic_id` FOREIGN KEY (`comment_topic_id`) REFERENCES `topic` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('14', '301', '20', '324234234234', '2017-05-09 22:07:16', null, '0', null);
INSERT INTO `comment` VALUES ('15', '301', '20', '第二条评论哦', '2017-05-09 22:07:16', null, '0', null);
INSERT INTO `comment` VALUES ('16', '301', '20', '第三条评论哦', '2017-05-09 22:07:16', null, '0', null);
INSERT INTO `comment` VALUES ('17', '300', '20', '评论一下其他的吧，哇', '2017-05-09 22:07:16', null, '0', null);
INSERT INTO `comment` VALUES ('18', '302', '20', 'wewrewrwer', '2017-05-09 22:07:16', null, '0', null);
INSERT INTO `comment` VALUES ('19', '302', '20', '234234', '2017-05-09 22:07:16', null, '0', null);
INSERT INTO `comment` VALUES ('20', '302', '20', '<img src=\"arclist/16.gif\">', '2017-05-09 22:07:16', null, '0', null);
INSERT INTO `comment` VALUES ('21', '302', '20', '<img src=\"arclist/16.gif\"><img src=\"arclist/16.gif\">', '2017-05-09 22:07:16', null, '0', null);
INSERT INTO `comment` VALUES ('22', '302', '20', '<img src=\"arclist/47.gif\">', '2017-05-09 22:07:16', null, '0', null);
INSERT INTO `comment` VALUES ('23', '303', '20', '<img src=\"arclist/35.gif\"><img src=\"arclist/35.gif\">', '2017-05-09 22:07:16', null, '0', null);
INSERT INTO `comment` VALUES ('24', '314', '20', '留个脚印', '2017-05-09 22:07:16', null, '0', null);
INSERT INTO `comment` VALUES ('25', '314', '20', '34234', '2017-05-09 22:07:16', null, '0', null);
INSERT INTO `comment` VALUES ('26', '314', '20', '  				\n', '2017-05-09 22:07:16', null, '0', null);
INSERT INTO `comment` VALUES ('27', '314', '20', '  				\n', '2017-05-09 22:07:16', null, '0', null);
INSERT INTO `comment` VALUES ('28', '314', '20', '\n', '2017-05-09 22:07:16', null, '0', null);
INSERT INTO `comment` VALUES ('29', '314', '20', '\n', '2017-05-09 22:07:16', null, '0', null);
INSERT INTO `comment` VALUES ('30', '314', '20', '\n', '2017-05-09 22:07:16', null, '0', null);
INSERT INTO `comment` VALUES ('31', '314', '20', '\n', '2017-05-09 22:07:16', null, '0', null);
INSERT INTO `comment` VALUES ('32', '313', '20', '\n[#j_0001]\n', '2017-05-09 22:07:16', null, '0', null);
INSERT INTO `comment` VALUES ('33', '313', '20', '\n[#j_0003][#B_0005][#i_f07][#B_0028][#w_0003][#y_0006]\n', '2017-05-09 22:07:16', null, '0', null);
INSERT INTO `comment` VALUES ('34', '313', '20', '\n[#jx2/j_0016]\n', '2017-05-09 22:07:16', null, '0', null);
INSERT INTO `comment` VALUES ('35', '313', '20', '\n[#jx2/j_0061]\n', '2017-05-09 22:07:16', null, '0', null);
INSERT INTO `comment` VALUES ('36', '314', '20', '<img src=\"arclist/33.gif\">', '2017-05-09 22:07:16', null, '0', null);
INSERT INTO `comment` VALUES ('37', '313', '20', '[#youa/y_0037]\n', '2017-05-09 22:07:16', null, '0', null);
INSERT INTO `comment` VALUES ('38', '314', '20', '\n[#jx2/j_0025]\n', '2017-05-09 22:07:16', null, '0', null);
INSERT INTO `comment` VALUES ('39', '314', '20', 'www.baidu.com\n', '2017-05-09 22:07:16', null, '0', null);
INSERT INTO `comment` VALUES ('40', '314', '20', 'baidu.com\n', '2017-05-09 22:07:16', null, '0', null);
INSERT INTO `comment` VALUES ('41', '314', '20', 'tyu\n\n', '2017-05-09 22:07:16', null, '0', null);
INSERT INTO `comment` VALUES ('42', '314', '20', '4567uh\n', '2017-05-09 22:07:16', null, '0', null);
INSERT INTO `comment` VALUES ('43', '314', '20', 'tjjf\n', '2017-05-09 22:07:16', null, '0', null);
INSERT INTO `comment` VALUES ('44', '331', '20', '<img src=\"arclist/19.gif\">', '2017-05-09 22:07:16', null, '0', null);
INSERT INTO `comment` VALUES ('45', '331', '20', '<img src=\"arclist/19.gif\">', '2017-05-09 22:07:16', null, '0', null);
INSERT INTO `comment` VALUES ('46', '331', '20', '[#jx2/j_0026]<img src=\"http://windows10.microdone.cn:8080/gltraffic/umeditor/dialogs/emotion/images/jx2/j_0026.gif\" style=\"white-space: normal;\">\n', '2017-05-09 22:07:16', null, '0', null);
INSERT INTO `comment` VALUES ('47', '331', '20', '[#jx2/j_0041]\n', '2017-05-09 22:07:16', null, '0', null);
INSERT INTO `comment` VALUES ('48', '331', '20', '\n[#jx2/j_0053]\n', '2017-05-09 22:07:16', null, '0', null);
INSERT INTO `comment` VALUES ('49', '331', '20', '[#jx2/j_0046]\n', '2017-05-09 22:07:16', null, '0', null);
INSERT INTO `comment` VALUES ('50', '331', '20', '\n[#jx2/j_0026]\n', '2017-05-09 22:07:16', null, '0', null);
INSERT INTO `comment` VALUES ('51', '331', '20', '[#babycat/C_0006]\n', '2017-05-09 22:07:16', null, '0', null);
INSERT INTO `comment` VALUES ('52', '331', '20', '\n[#jx2/j_0003]\n', '2017-05-09 22:07:16', null, '0', null);
INSERT INTO `comment` VALUES ('53', '332', '20', '我也觉得', '2017-05-09 22:07:16', null, '0', null);
INSERT INTO `comment` VALUES ('54', '332', '20', '我也觉得<img src=\"arclist/32.gif\">', '2017-05-09 22:07:16', null, '0', null);
INSERT INTO `comment` VALUES ('55', '332', '20', '无法上谨慎', '2017-05-09 22:07:16', null, '0', null);
INSERT INTO `comment` VALUES ('56', '334', '20', '[#jx2/j_0019][#jx2/j_0014]\n', '2017-05-09 22:07:16', null, '0', null);
INSERT INTO `comment` VALUES ('57', '334', '20', '\n[#jx2/j_0005]\n', '2017-05-09 22:07:16', null, '0', null);
INSERT INTO `comment` VALUES ('58', '335', '20', '<img src=\"arclist/20.gif\">', '2017-05-09 22:07:16', null, '0', null);
INSERT INTO `comment` VALUES ('63', '347', '25', '不知道<br>', '2017-05-09 22:07:16', null, '1', null);
INSERT INTO `comment` VALUES ('64', '332', '20', '好想吃[#jx2/j_0027]\n', '2017-05-09 22:07:16', null, '0', null);
INSERT INTO `comment` VALUES ('65', '332', '20', '好好吃，想每天吃两个这样的！！\n', '2017-05-09 22:07:16', null, '0', null);
INSERT INTO `comment` VALUES ('66', null, '22', '213123\n', '2017-05-09 22:07:16', null, '1', null);
INSERT INTO `comment` VALUES ('67', '370', '22', '51635\n', '2017-05-09 22:07:16', null, '0', null);
INSERT INTO `comment` VALUES ('68', '370', '22', '21321\n', '2017-05-09 22:07:16', null, '0', null);
INSERT INTO `comment` VALUES ('69', '370', '22', '51313\n', '2017-05-09 22:07:16', null, '0', null);
INSERT INTO `comment` VALUES ('70', '371', '22', '363\n\n', '2017-05-09 22:07:16', null, '0', null);
INSERT INTO `comment` VALUES ('71', '371', '22', '5463\n', '2017-05-09 22:07:16', null, '0', null);
INSERT INTO `comment` VALUES ('72', '374', '20', '我觉得也是\n', '2017-05-09 22:07:16', null, '0', null);
INSERT INTO `comment` VALUES ('73', '379', '22', '321<br>3<br>', '2017-05-09 22:07:16', null, '0', null);
INSERT INTO `comment` VALUES ('74', '381', '22', '好绿[#jx2/j_0003]\n', '2017-05-09 22:07:16', null, '0', null);
INSERT INTO `comment` VALUES ('76', '386', '20', '32<br>3<br>', '2017-05-09 22:07:16', null, '0', null);
INSERT INTO `comment` VALUES ('77', '380', '20', '\n[#jx2/j_0038]\n', '2017-05-09 22:07:16', null, '0', null);
INSERT INTO `comment` VALUES ('93', '401', '20', '[#jx2/j_0002][#jx2/j_0015]2013年5月9日 - 英文引用及参考文献格式要求 一、参考文献的类型 参考文献(即引文出处)的类型以单字母方式标识,具体如下: M——专著 C——论文集 N——报纸文章 J——...\n', '2017-04-16 22:06:54', null, '0', null);
INSERT INTO `comment` VALUES ('94', '401', '20', '好吧！！', '2017-04-16 22:07:08', '93', '0', null);
INSERT INTO `comment` VALUES ('95', '401', '20', '[#jx2/j_0002][#jx2/j_0015]2013年5月9日 - 英文引用及参考文献格式要求 一、参考文献的类型 参考文献(即引文出处)的类型以单字母方式标识,具体如下: M——专著 C——论文集 N——报纸文章 J——...[#jx2/j_0002][#jx2/j_0015]2013年5月9日 - 英文引用及参考文献格式要求 一、参考文献的类型 参考文献(即引文出处)的类型以单字母方式标识,具体如下: M——专著 C——论文集 N——报纸文章 J——...[#jx2/j_0002][#jx2/j_0015]2013年5月9日 - 英文引用及参考文献格式要求 一、参考文献的类型 参考文献(即引文出处)的类型以单字母方式标识,具体如下: M——专著 C——论文集 N——报纸文章 J——...[#jx2/j_0002][#jx2/j_0015]2013年5月9日 - 英文引用及参考文献格式要求 一、参考文献的类型 参考文献(即引文出处)的类型以单字母方式标识,具体如下: M——专著 C——论文集 N——报纸文章 J——...\n', '2017-04-16 22:07:34', null, '0', null);
INSERT INTO `comment` VALUES ('96', '401', '20', 'SB', '2017-04-16 22:09:14', '95', '0', null);
INSERT INTO `comment` VALUES ('97', '401', '20', '你也是SB吗', '2017-04-16 22:12:09', null, '0', null);
INSERT INTO `comment` VALUES ('98', '401', '20', '？？？？？？', '2017-04-16 22:12:45', '96', '0', null);
INSERT INTO `comment` VALUES ('99', '401', '20', '为什么是空？', '2017-04-16 22:12:56', '96', '0', null);
INSERT INTO `comment` VALUES ('100', '401', '20', '好吧', '2017-04-16 22:13:05', '97', '0', null);
INSERT INTO `comment` VALUES ('101', '401', '20', '章 J——...2013年5月9日 - 英文引用及参考文献格式要求 一、参考文献的类型 参考文献(即引文出处)的类型以单字母方式标识,具体如下: M——专著 C——论文集 N——报纸文章 J——...\n\n									\n								', '2017-04-16 22:14:16', '95', '0', null);
INSERT INTO `comment` VALUES ('102', '401', '20', 'what the fuck<br>', '2017-04-16 22:17:09', '101', '0', null);
INSERT INTO `comment` VALUES ('103', '403', '20', '图片和视频一起发吗[#babycat/C_0016][#babycat/C_0017][#jx2/j_0022]\n', '2017-04-16 22:45:03', null, '0', null);
INSERT INTO `comment` VALUES ('104', '403', '20', '表情不错啊', '2017-04-16 22:45:16', '103', '0', null);
INSERT INTO `comment` VALUES ('105', '403', '20', 'fuck your mother<br>', '2017-04-16 23:02:01', '103', '0', null);
INSERT INTO `comment` VALUES ('106', '404', '20', '[#jx2/j_0001]\n', '2017-04-17 15:09:33', null, '0', null);
INSERT INTO `comment` VALUES ('107', '404', '20', '51325\n', '2017-04-17 15:12:47', null, '0', null);
INSERT INTO `comment` VALUES ('108', '404', '20', 'hello', '2017-04-17 15:13:22', null, '0', null);
INSERT INTO `comment` VALUES ('109', '403', '20', '嘻嘻<br>', '2017-04-17 15:13:57', null, '0', null);
INSERT INTO `comment` VALUES ('110', '404', '20', '顶<br>', '2017-04-17 15:27:59', null, '0', null);
INSERT INTO `comment` VALUES ('111', '402', '20', '天啊，都跑这来了\n', '2017-04-17 15:28:50', null, '0', null);
INSERT INTO `comment` VALUES ('112', '402', '24', '6413213.', '2017-04-17 15:45:41', null, '0', null);
INSERT INTO `comment` VALUES ('113', '402', '20', '546yttgdfg', '2017-04-18 13:46:24', '111', '0', null);
INSERT INTO `comment` VALUES ('120', '402', '20', 'wfsdf <br>', '2017-04-18 22:07:48', null, '0', null);
INSERT INTO `comment` VALUES ('123', '299', '20', '[#jx2/j_0002]这已经是2月26号的帖子了\n', '2017-04-19 14:35:28', null, '0', null);
INSERT INTO `comment` VALUES ('124', '299', '20', '\n[#jx2/j_0001]\n', '2017-04-19 14:38:22', null, '0', null);
INSERT INTO `comment` VALUES ('132', '402', '20', '顶一个', '2017-04-21 14:36:32', null, '0', null);
INSERT INTO `comment` VALUES ('133', '318', '20', '烦你妈B[#ldw/w_0016]\n', '2017-04-21 14:42:13', null, '0', null);
INSERT INTO `comment` VALUES ('134', '318', '20', '\n[#jx2/j_0005]\n', '2017-04-21 14:42:37', null, '0', null);
INSERT INTO `comment` VALUES ('136', '318', '20', '\n[#jx2/j_0003]\n', '2017-04-21 14:43:38', null, '0', null);
INSERT INTO `comment` VALUES ('137', '318', '20', '\n[#jx2/j_0002]\n', '2017-04-21 14:44:41', null, '0', null);
INSERT INTO `comment` VALUES ('138', '318', '20', '\n[#jx2/j_0002]\n', '2017-04-21 14:44:51', null, '0', null);
INSERT INTO `comment` VALUES ('139', '318', '20', '[#jx2/j_0003]\n', '2017-04-21 14:45:12', null, '0', null);
INSERT INTO `comment` VALUES ('141', '318', '20', '[#jx2/j_0003]\n', '2017-04-21 14:47:15', null, '0', null);
INSERT INTO `comment` VALUES ('142', '318', '20', '\n[#face/i_f18]\n', '2017-04-21 14:47:25', null, '0', null);
INSERT INTO `comment` VALUES ('147', '401', '20', '<br>好吃', '2017-04-21 21:42:15', null, '0', null);
INSERT INTO `comment` VALUES ('148', '402', '20', '<img src=\"arclist/16.gif\">', '2017-04-22 21:13:56', null, '0', null);
INSERT INTO `comment` VALUES ('149', '433', '20', '[#jx2/j_0002]\n', '2017-04-23 11:38:17', null, '0', null);
INSERT INTO `comment` VALUES ('150', '433', '20', '测试评论', '2017-04-23 12:30:00', null, '0', null);
INSERT INTO `comment` VALUES ('151', '402', '20', '123', '2017-05-01 18:55:02', null, '0', null);
INSERT INTO `comment` VALUES ('153', '321', '20', '\n[#jx2/j_0002]\n', '2017-05-02 14:41:39', null, '0', null);
INSERT INTO `comment` VALUES ('154', '457', '27', '\n[#jx2/j_0002]\n', '2017-05-02 22:34:58', null, '0', null);
INSERT INTO `comment` VALUES ('155', '457', '27', '2132', '2017-05-02 22:35:07', '154', '0', null);
INSERT INTO `comment` VALUES ('156', '457', '27', '\n[#jx2/j_0006]\n', '2017-05-02 22:36:24', null, '0', null);
INSERT INTO `comment` VALUES ('157', '457', '27', '21321', '2017-05-02 22:37:00', '156', '0', null);
INSERT INTO `comment` VALUES ('158', '321', '20', '13123', '2017-05-02 22:38:44', null, '0', null);
INSERT INTO `comment` VALUES ('159', '321', '20', '12312323', '2017-05-02 22:39:04', '158', '0', null);
INSERT INTO `comment` VALUES ('160', '321', '20', '[#face/i_f17]\n', '2017-05-02 22:40:03', null, '0', null);
INSERT INTO `comment` VALUES ('161', '321', '20', '1111111111111111', '2017-05-02 22:40:22', '160', '0', null);
INSERT INTO `comment` VALUES ('162', '457', '27', '\n[#jx2/j_0028][#jx2/j_0028]\n', '2017-05-02 22:44:17', null, '0', null);
INSERT INTO `comment` VALUES ('163', '457', '27', '11', '2017-05-02 22:44:42', '162', '0', null);
INSERT INTO `comment` VALUES ('164', '321', '20', '234235423', '2017-05-04 08:24:22', null, '0', null);
INSERT INTO `comment` VALUES ('165', '321', '20', '\n[#jx2/j_0013]\n', '2017-05-04 08:29:42', null, '0', null);
INSERT INTO `comment` VALUES ('166', '457', '27', '5656', '2017-05-07 13:22:33', '157', '0', null);
INSERT INTO `comment` VALUES ('167', '471', '20', '<img src=\"arclist/1.gif\">', '2017-05-09 22:29:47', null, '0', null);
INSERT INTO `comment` VALUES ('168', '467', '20', '<img src=\"arclist/18.gif\">', '2017-05-09 22:30:09', null, '0', null);
INSERT INTO `comment` VALUES ('169', '302', '20', '我觉得这个曝光好！\n', '2017-05-12 21:53:11', null, '0', null);
INSERT INTO `comment` VALUES ('170', '302', '20', '[#jx2/j_0015]不觉得这个人很不礼貌吗？\n', '2017-05-12 21:53:35', null, '0', null);
INSERT INTO `comment` VALUES ('171', '302', '20', '我也觉得！！<br>', '2017-05-12 22:22:20', '170', '0', null);
INSERT INTO `comment` VALUES ('172', '476', '30', '请跟踪报道这个新闻，我想知道现行法规会不会不痛不痒地处罚了事，很多恶行就是这样让人无能为力      [#jx2/j_0027]\n', '2017-05-24 23:41:05', null, '0', null);
INSERT INTO `comment` VALUES ('173', '476', '30', '连插车未遂都要报复，这种人将来很容易犯罪的，赶快抓起来吧        [#jx2/j_0082]\n', '2017-05-24 23:41:37', null, '0', null);
INSERT INTO `comment` VALUES ('174', '476', '30', '[#jx2/j_0003]无语！\n', '2017-05-24 23:41:56', null, '0', null);
INSERT INTO `comment` VALUES ('175', '485', '30', '想死自己安安静静的去死好吗[#jx2/j_0027]\n', '2017-05-24 23:42:31', null, '1', null);
INSERT INTO `comment` VALUES ('176', '490', '30', '支持永久吊销皇冠车主驾驶执照，再顺便关个十天半月。', '2017-05-24 23:42:58', null, '0', null);
INSERT INTO `comment` VALUES ('177', '484', '30', '这种人就该严惩        ', '2017-05-24 23:43:08', null, '0', null);
INSERT INTO `comment` VALUES ('178', '482', '30', '这种人想死就安安静静的死&nbsp;&nbsp;&nbsp;&nbsp;高速路上出事引起的大事故还少吗&nbsp;&nbsp;&nbsp;&nbsp;必须严惩&nbsp;&nbsp;&nbsp;希望不是扣积分 罚点钱就完事儿这种结果<img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/5c/huanglianwx_org.gif\" title=\"[微笑]\" alt=\"[微笑]\" type=\"face\">', '2017-05-24 23:43:33', null, '1', null);
INSERT INTO `comment` VALUES ('179', '480', '30', '以后大家要注意了， \n  ', '2017-05-24 23:44:31', null, '1', null);
INSERT INTO `comment` VALUES ('180', '479', '30', '惊讶吧！你的处罚是集满10个“赞” \n  ', '2017-05-24 23:44:41', null, '0', null);
INSERT INTO `comment` VALUES ('181', '478', '30', '是个疯子吧<img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/0b/wabi_org.gif\" title=\"[挖鼻]\" alt=\"[挖鼻]\" type=\"face\">', '2017-05-24 23:45:08', null, '0', null);
INSERT INTO `comment` VALUES ('182', '478', '30', '没见过这样不爱惜自己生命的人<br>', '2017-05-24 23:45:22', null, '0', null);
INSERT INTO `comment` VALUES ('183', '477', '30', '太可怕，！！！<br>', '2017-05-24 23:45:39', null, '0', null);
INSERT INTO `comment` VALUES ('184', '481', '30', '父母也是会带节奏<br>', '2017-05-24 23:45:58', null, '1', null);
INSERT INTO `comment` VALUES ('185', '481', '31', '<img src=\"arclist/16.gif\">现在的学生应该加强这方面的教育，不然有一天死了都不知道！<br>', '2017-05-24 23:49:24', null, '1', null);
INSERT INTO `comment` VALUES ('186', '477', '31', '我还能说什么。。[#jx2/j_0002]\n', '2017-05-24 23:51:04', null, '0', null);
INSERT INTO `comment` VALUES ('187', '480', '31', '这车真酷，评论我都累了<br>', '2017-05-24 23:51:29', null, '1', null);
INSERT INTO `comment` VALUES ('188', '482', '31', '在外面经常见这样的人，完全不当回事<br>', '2017-05-24 23:51:54', null, '1', null);
INSERT INTO `comment` VALUES ('189', '484', '31', '在外面经常见这样的人，完全不当回事，路都挤成狗了<br>', '2017-05-24 23:52:14', null, '0', null);
INSERT INTO `comment` VALUES ('190', '490', '31', '在外面经常见这样的人，完全不当回事，路都挤成狗了', '2017-05-24 23:52:18', null, '0', null);
INSERT INTO `comment` VALUES ('191', '485', '31', '在外面经常见这样的人，完全不当回事，', '2017-05-24 23:52:25', null, '0', null);
INSERT INTO `comment` VALUES ('192', '485', '31', '每个人都这样车还怎么开啊<br>', '2017-05-24 23:52:42', null, '0', null);
INSERT INTO `comment` VALUES ('193', '476', '31', '强！', '2017-05-24 23:52:49', null, '0', null);
INSERT INTO `comment` VALUES ('194', '483', '31', '笑话', '2017-05-24 23:52:57', null, '0', null);
INSERT INTO `comment` VALUES ('195', '478', '31', '在广场那里，<br>', '2017-05-24 23:53:11', null, '0', null);
INSERT INTO `comment` VALUES ('196', '483', '31', '笑得真开心的感觉，完全把生命当玩笑了[#jx2/j_0025]\n', '2017-05-24 23:53:39', null, '0', null);
INSERT INTO `comment` VALUES ('197', '478', '31', '[#ldw/w_0039]，怎么会有人这样逆行呢\n', '2017-05-24 23:54:32', null, '0', null);
INSERT INTO `comment` VALUES ('198', '478', '31', '无语', '2017-05-24 23:54:44', null, '0', null);
INSERT INTO `comment` VALUES ('199', '483', '31', '无语<br>', '2017-05-24 23:54:53', null, '0', null);
INSERT INTO `comment` VALUES ('200', '483', '31', '这不是经常的事吗<br>', '2017-05-24 23:55:04', null, '0', null);
INSERT INTO `comment` VALUES ('201', '476', '31', '素质需要加强！！<br>', '2017-05-24 23:55:20', null, '0', null);
INSERT INTO `comment` VALUES ('202', '485', '31', '想死自己安安静静的去死好吗<img src=\"arclist/35.gif\">', '2017-05-24 23:55:33', null, '0', null);
INSERT INTO `comment` VALUES ('203', '490', '31', '路都不让人走了<br>', '2017-05-24 23:55:42', null, '0', null);
INSERT INTO `comment` VALUES ('204', '490', '31', '还不安全<br>', '2017-05-24 23:55:49', null, '0', null);
INSERT INTO `comment` VALUES ('205', '490', '22', '评论得我都累了，这车怎么像教练车<br>', '2017-05-24 23:56:41', null, '0', null);
INSERT INTO `comment` VALUES ('206', '485', '22', '这是那呀，楼怎么那么好看@<br>', '2017-05-24 23:57:01', null, '0', null);
INSERT INTO `comment` VALUES ('207', '476', '22', '不想被罚钱呗<br>', '2017-05-24 23:57:20', null, '0', null);
INSERT INTO `comment` VALUES ('208', '483', '22', '感觉自己飞起来啦<br>', '2017-05-24 23:57:31', null, '0', null);
INSERT INTO `comment` VALUES ('209', '484', '22', '此地无银三百两<br>', '2017-05-24 23:57:52', null, '0', null);
INSERT INTO `comment` VALUES ('210', '482', '22', '不当生命一回事<br>', '2017-05-24 23:58:02', null, '1', null);
INSERT INTO `comment` VALUES ('211', '480', '22', '这车开不走了，尴尬<br>', '2017-05-24 23:58:14', null, '1', null);
INSERT INTO `comment` VALUES ('212', '477', '22', '被撞得粉碎了，自己活不成还把别人的生命当玩笑<br>', '2017-05-24 23:58:43', null, '0', null);
INSERT INTO `comment` VALUES ('213', '481', '22', '有父必有此子的说法就是这样的嘛，反正好多人都这样<br>', '2017-05-24 23:59:18', null, '1', null);
INSERT INTO `comment` VALUES ('214', '481', '24', '这是那呀，怎么像是七星区，经常发生啦\n', '2017-05-25 00:04:44', null, '1', null);
INSERT INTO `comment` VALUES ('215', '481', '24', '可能还没走完红灯就亮了也不一定[#jx2/j_0012]\n', '2017-05-25 00:05:13', null, '1', null);
INSERT INTO `comment` VALUES ('216', '477', '24', '眼瞎了，害死自己[#jx2/j_0025]\n', '2017-05-25 00:05:40', null, '0', null);
INSERT INTO `comment` VALUES ('217', '480', '24', '还能说什么\n', '2017-05-25 00:06:00', null, '1', null);
INSERT INTO `comment` VALUES ('218', '481', '24', '还能说什么<img src=\"http://windows10.microdone.cn:8080/gltraffic/umeditor/dialogs/emotion/images/jx2/j_0022.gif\" _src=\"http://windows10.microdone.cn:8080/gltraffic/umeditor/dialogs/emotion/images/jx2/j_0022.gif\">', '2017-05-25 00:06:32', null, '1', null);
INSERT INTO `comment` VALUES ('219', '482', '24', '还能说什么<img src=\"http://windows10.microdone.cn:8080/gltraffic/umeditor/dialogs/emotion/images/jx2/j_0022.gif\" _src=\"http://windows10.microdone.cn:8080/gltraffic/umeditor/dialogs/emotion/images/jx2/j_0022.gif\">', '2017-05-25 00:06:36', null, '1', null);
INSERT INTO `comment` VALUES ('220', '484', '24', '还能说什么<img src=\"http://windows10.microdone.cn:8080/gltraffic/umeditor/dialogs/emotion/images/jx2/j_0022.gif\" _src=\"http://windows10.microdone.cn:8080/gltraffic/umeditor/dialogs/emotion/images/jx2/j_0022.gif\">', '2017-05-25 00:06:40', null, '0', null);
INSERT INTO `comment` VALUES ('221', '483', '24', '还能说什么<img src=\"http://windows10.microdone.cn:8080/gltraffic/umeditor/dialogs/emotion/images/jx2/j_0022.gif\" _src=\"http://windows10.microdone.cn:8080/gltraffic/umeditor/dialogs/emotion/images/jx2/j_0022.gif\">', '2017-05-25 00:06:43', null, '0', null);
INSERT INTO `comment` VALUES ('222', '476', '24', '还能说什么<img src=\"http://windows10.microdone.cn:8080/gltraffic/umeditor/dialogs/emotion/images/jx2/j_0022.gif\" _src=\"http://windows10.microdone.cn:8080/gltraffic/umeditor/dialogs/emotion/images/jx2/j_0022.gif\">', '2017-05-25 00:06:47', null, '0', null);
INSERT INTO `comment` VALUES ('223', '485', '24', '还能说什么<img src=\"http://windows10.microdone.cn:8080/gltraffic/umeditor/dialogs/emotion/images/jx2/j_0022.gif\" _src=\"http://windows10.microdone.cn:8080/gltraffic/umeditor/dialogs/emotion/images/jx2/j_0022.gif\">', '2017-05-25 00:06:51', null, '0', null);
INSERT INTO `comment` VALUES ('224', '490', '24', '还能说什么<img src=\"http://windows10.microdone.cn:8080/gltraffic/umeditor/dialogs/emotion/images/jx2/j_0022.gif\" _src=\"http://windows10.microdone.cn:8080/gltraffic/umeditor/dialogs/emotion/images/jx2/j_0022.gif\">', '2017-05-25 00:06:56', null, '0', null);
INSERT INTO `comment` VALUES ('225', '479', '24', '还能说什么<img src=\"http://windows10.microdone.cn:8080/gltraffic/umeditor/dialogs/emotion/images/jx2/j_0022.gif\" _src=\"http://windows10.microdone.cn:8080/gltraffic/umeditor/dialogs/emotion/images/jx2/j_0022.gif\">', '2017-05-25 00:07:01', null, '0', null);
INSERT INTO `comment` VALUES ('226', '479', '25', '每个人都觉得意外不会发生在自己身上，[#jx2/j_0083]\n', '2017-05-25 00:10:17', null, '0', null);
INSERT INTO `comment` VALUES ('227', '490', '25', '每个人都觉得意外不会发生在自己身上，<img src=\"http://windows10.microdone.cn:8080/gltraffic/umeditor/dialogs/emotion/images/jx2/j_0083.gif\" _src=\"http://windows10.microdone.cn:8080/gltraffic/umeditor/dialogs/emotion/images/jx2/j_0083.gif\">', '2017-05-25 00:10:26', null, '0', null);
INSERT INTO `comment` VALUES ('228', '485', '25', '每个人都觉得意外不会发生在自己身上，<img src=\"http://windows10.microdone.cn:8080/gltraffic/umeditor/dialogs/emotion/images/jx2/j_0083.gif\" _src=\"http://windows10.microdone.cn:8080/gltraffic/umeditor/dialogs/emotion/images/jx2/j_0083.gif\">', '2017-05-25 00:10:30', null, '0', null);
INSERT INTO `comment` VALUES ('229', '476', '25', '每个人都觉得意外不会发生在自己身上，<img src=\"http://windows10.microdone.cn:8080/gltraffic/umeditor/dialogs/emotion/images/jx2/j_0083.gif\" _src=\"http://windows10.microdone.cn:8080/gltraffic/umeditor/dialogs/emotion/images/jx2/j_0083.gif\">', '2017-05-25 00:10:33', null, '0', null);
INSERT INTO `comment` VALUES ('230', '483', '25', '每个人都觉得意外不会发生在自己身上，<img src=\"http://windows10.microdone.cn:8080/gltraffic/umeditor/dialogs/emotion/images/jx2/j_0083.gif\" _src=\"http://windows10.microdone.cn:8080/gltraffic/umeditor/dialogs/emotion/images/jx2/j_0083.gif\">', '2017-05-25 00:10:38', null, '0', null);
INSERT INTO `comment` VALUES ('231', '484', '25', '每个人都觉得意外不会发生在自己身上，<img src=\"http://windows10.microdone.cn:8080/gltraffic/umeditor/dialogs/emotion/images/jx2/j_0083.gif\" _src=\"http://windows10.microdone.cn:8080/gltraffic/umeditor/dialogs/emotion/images/jx2/j_0083.gif\">', '2017-05-25 00:10:42', null, '0', null);
INSERT INTO `comment` VALUES ('232', '482', '25', '每个人都觉得意外不会发生在自己身上，<img src=\"http://windows10.microdone.cn:8080/gltraffic/umeditor/dialogs/emotion/images/jx2/j_0083.gif\" _src=\"http://windows10.microdone.cn:8080/gltraffic/umeditor/dialogs/emotion/images/jx2/j_0083.gif\">', '2017-05-25 00:10:46', null, '1', null);
INSERT INTO `comment` VALUES ('233', '481', '25', '每个人都觉得意外不会发生在自己身上，<img src=\"http://windows10.microdone.cn:8080/gltraffic/umeditor/dialogs/emotion/images/jx2/j_0083.gif\" _src=\"http://windows10.microdone.cn:8080/gltraffic/umeditor/dialogs/emotion/images/jx2/j_0083.gif\">', '2017-05-25 00:10:50', null, '1', null);
INSERT INTO `comment` VALUES ('234', '480', '25', '每个人都觉得意外不会发生在自己身上，<img src=\"http://windows10.microdone.cn:8080/gltraffic/umeditor/dialogs/emotion/images/jx2/j_0083.gif\" _src=\"http://windows10.microdone.cn:8080/gltraffic/umeditor/dialogs/emotion/images/jx2/j_0083.gif\">', '2017-05-25 00:10:55', null, '1', null);
INSERT INTO `comment` VALUES ('235', '477', '25', '每个人都觉得意外不会发生在自己身上，<img src=\"http://windows10.microdone.cn:8080/gltraffic/umeditor/dialogs/emotion/images/jx2/j_0083.gif\" _src=\"http://windows10.microdone.cn:8080/gltraffic/umeditor/dialogs/emotion/images/jx2/j_0083.gif\">', '2017-05-25 00:10:59', null, '0', null);
INSERT INTO `comment` VALUES ('236', '478', '25', '每个人都觉得意外不会发生在自己身上，<img src=\"http://windows10.microdone.cn:8080/gltraffic/umeditor/dialogs/emotion/images/jx2/j_0083.gif\" _src=\"http://windows10.microdone.cn:8080/gltraffic/umeditor/dialogs/emotion/images/jx2/j_0083.gif\">', '2017-05-25 00:11:05', null, '0', null);
INSERT INTO `comment` VALUES ('237', '478', '25', '当发生在自己身上的时，没时间后悔<br>', '2017-05-25 00:15:38', '236', '0', null);
INSERT INTO `comment` VALUES ('238', '496', '22', '笑成这样。。<br>', '2017-06-02 16:07:24', null, '0', null);
INSERT INTO `comment` VALUES ('239', '500', '22', '大班车，太可怕，万一万一万一[#jx2/j_0021][#jx2/j_0021]\n', '2017-06-02 20:09:39', null, '0', null);
INSERT INTO `comment` VALUES ('240', '500', '22', '.......', '2017-06-02 20:09:52', '239', '0', null);
INSERT INTO `comment` VALUES ('241', '498', '27', '坏了要赔了<br>', '2017-06-02 20:16:16', null, '0', null);
INSERT INTO `comment` VALUES ('242', '493', '20', '<img src=\"arclist/43.gif\">', '2017-06-03 23:25:25', null, '0', null);
INSERT INTO `comment` VALUES ('243', '493', '20', '[#jx2/j_0005]\n', '2017-06-03 23:33:31', null, '0', null);
INSERT INTO `comment` VALUES ('244', '493', '20', '监控真厉害', '2017-06-03 23:36:07', '242', '0', null);
INSERT INTO `comment` VALUES ('245', '493', '22', '\n[#jx2/j_0002]\n', '2017-06-03 23:41:41', null, '0', null);
INSERT INTO `comment` VALUES ('246', '493', '22', '嘻嘻', '2017-06-03 23:42:16', '245', '0', null);
INSERT INTO `comment` VALUES ('247', '498', '27', '24', '2017-06-15 13:00:18', null, '1', null);
INSERT INTO `comment` VALUES ('248', '498', '27', '\n[#jx2/j_0015]\n', '2017-06-15 13:18:21', null, '1', null);
INSERT INTO `comment` VALUES ('249', '509', '27', '发表自己的评论\n', '2017-06-15 13:20:42', null, '0', null);

-- ----------------------------
-- Table structure for index_banner
-- ----------------------------
DROP TABLE IF EXISTS `index_banner`;
CREATE TABLE `index_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(100) DEFAULT NULL,
  `content` varchar(100) DEFAULT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of index_banner
-- ----------------------------
INSERT INTO `index_banner` VALUES ('1', '1.jpg', 'sdf', '2017-04-23 16:12:02');
INSERT INTO `index_banner` VALUES ('2', '2.jpg', 'sfc', '2017-04-23 16:12:07');
INSERT INTO `index_banner` VALUES ('3', '3.jpg', 'sdf', '2017-04-23 16:12:13');

-- ----------------------------
-- Table structure for marktype
-- ----------------------------
DROP TABLE IF EXISTS `marktype`;
CREATE TABLE `marktype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(10) DEFAULT NULL,
  `type_describe` varchar(50) DEFAULT NULL,
  `type_image` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of marktype
-- ----------------------------
INSERT INTO `marktype` VALUES ('1', '警告标志', '黄色警告标志', '1.png');
INSERT INTO `marktype` VALUES ('2', '禁止标志', '红色禁止标志', '2.png');
INSERT INTO `marktype` VALUES ('3', '指示标志', '蓝色指示标志', '3.png');

-- ----------------------------
-- Table structure for messageboard
-- ----------------------------
DROP TABLE IF EXISTS `messageboard`;
CREATE TABLE `messageboard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `messb_to_userid` int(11) DEFAULT NULL,
  `messb_from_userid` int(11) DEFAULT NULL,
  `messb_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `messb_content` text,
  `messb_type` tinyint(4) DEFAULT NULL,
  `messb_status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `messb_to_userid` (`messb_to_userid`),
  KEY `messb_from_userid` (`messb_from_userid`),
  CONSTRAINT `messageboard_ibfk_1` FOREIGN KEY (`messb_to_userid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `messageboard_ibfk_2` FOREIGN KEY (`messb_from_userid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of messageboard
-- ----------------------------
INSERT INTO `messageboard` VALUES ('1', '20', '22', '2017-04-25 23:34:36', '第一条留言', '1', '0');
INSERT INTO `messageboard` VALUES ('2', '20', '20', '2017-04-25 23:34:38', '1231234534', '1', '0');
INSERT INTO `messageboard` VALUES ('3', '20', '23', '2017-04-25 23:34:35', '哇，你曝光哇，你曝光了好多好多哦，你不怕被打吗哇，你曝光了好多好多哦，你不怕被打吗哇，你曝光了好多好多哦，你不怕被打吗哇，你曝光了好多好多哦，你不怕被打吗哇，你曝光了好多好多哦，你不怕被打吗哇，你曝光了好多好多哦，你不怕被打吗哇，你曝光了好多好多哦，你不怕被打吗哇，你曝光了好多好多哦，你不怕被打吗哇，你曝光了好多好多哦，你不怕被打吗哇，你曝光了好多好多哦，你不怕被打吗哇，你曝光了好多好多哦，你不怕被打吗哇，你曝光了好多好多哦，你不怕被打吗了好多好多哦，你不怕被打吗', '1', '0');
INSERT INTO `messageboard` VALUES ('4', '20', '24', '2017-04-25 23:34:34', '123123123', '2', '0');
INSERT INTO `messageboard` VALUES ('5', '20', '20', '2017-04-25 23:34:34', '<p>妈的<br/></p>', null, '0');
INSERT INTO `messageboard` VALUES ('6', '20', '20', '2017-04-25 23:34:32', '<p><br/><img src=\"http://127.0.0.1:8080/gltraffic/umeditor/dialogs/emotion/images/jx2/j_0015.gif\"/><img src=\"http://127.0.0.1:8080/gltraffic/umeditor/dialogs/emotion/images/jx2/j_0024.gif\"/></p>', null, '0');
INSERT INTO `messageboard` VALUES ('7', '26', '20', '2017-04-25 23:34:38', '<p><br/><img src=\"http://127.0.0.1:8080/gltraffic/umeditor/dialogs/emotion/images/jx2/j_0025.gif\"/>hello,你好吗！你的曝光内容怎么那么棒呢！！</p>', null, '1');
INSERT INTO `messageboard` VALUES ('8', '26', '20', '2017-04-25 23:34:39', '<p><img src=\"http://127.0.0.1:8080/gltraffic/umeditor/dialogs/emotion/images/jx2/j_0025.gif\"/>hello,你好吗！你的曝光内容怎么那么棒呢！！</p>', null, '1');
INSERT INTO `messageboard` VALUES ('9', '26', '20', '2017-04-25 23:34:40', '<p><br/><img src=\"http://127.0.0.1:8080/gltraffic/umeditor/dialogs/emotion/images/jx2/j_0003.gif\"/></p>', null, '1');
INSERT INTO `messageboard` VALUES ('10', '26', '20', '2017-04-25 23:34:41', '<p>45456<br/></p>', null, '1');
INSERT INTO `messageboard` VALUES ('11', '26', '20', '2017-04-25 23:34:42', '<p>12312<br/></p>', null, '1');
INSERT INTO `messageboard` VALUES ('12', '20', '20', '2017-04-25 23:34:44', '<p><img src=\"http://127.0.0.1:8080/gltraffic/umeditor/dialogs/emotion/images/jx2/j_0002.gif\"/></p>', null, '0');
INSERT INTO `messageboard` VALUES ('13', '24', '20', '2017-05-10 19:59:14', '<p><br/><img src=\"http://127.0.0.1:8080/gltraffic/umeditor/dialogs/emotion/images/jx2/j_0001.gif\"/></p>', null, '1');
INSERT INTO `messageboard` VALUES ('14', '24', '20', '2017-05-10 19:59:15', '<p><br/><img src=\"http://127.0.0.1:8080/gltraffic/umeditor/dialogs/emotion/images/jx2/j_0001.gif\"/></p>', null, '1');
INSERT INTO `messageboard` VALUES ('15', '24', '20', '2017-05-10 19:59:15', '<p><br/><img src=\"http://127.0.0.1:8080/gltraffic/umeditor/dialogs/emotion/images/jx2/j_0001.gif\"/></p>', null, '1');
INSERT INTO `messageboard` VALUES ('16', '24', '20', '2017-05-10 19:59:16', '<p><br/><img src=\"http://127.0.0.1:8080/gltraffic/umeditor/dialogs/emotion/images/jx2/j_0001.gif\"/></p>', null, '1');
INSERT INTO `messageboard` VALUES ('17', '24', '20', '2017-05-10 19:59:16', '<p><br/><img src=\"http://127.0.0.1:8080/gltraffic/umeditor/dialogs/emotion/images/jx2/j_0001.gif\"/></p>', null, '1');
INSERT INTO `messageboard` VALUES ('18', '24', '20', '2017-05-10 19:59:17', '<p><br/><img src=\"http://127.0.0.1:8080/gltraffic/umeditor/dialogs/emotion/images/jx2/j_0001.gif\"/></p>', null, '1');
INSERT INTO `messageboard` VALUES ('19', '24', '20', '2017-05-10 19:59:18', '<p><br/><img src=\"http://127.0.0.1:8080/gltraffic/umeditor/dialogs/emotion/images/jx2/j_0001.gif\"/></p>', null, '1');
INSERT INTO `messageboard` VALUES ('20', '24', '20', '2017-05-10 19:59:19', '<p><br/><img src=\"http://127.0.0.1:8080/gltraffic/umeditor/dialogs/emotion/images/jx2/j_0001.gif\"/></p>', null, '1');
INSERT INTO `messageboard` VALUES ('21', '24', '20', '2017-05-10 19:59:20', '<p><img src=\"http://127.0.0.1:8080/gltraffic/umeditor/dialogs/emotion/images/jx2/j_0001.gif\"/></p>', null, '1');
INSERT INTO `messageboard` VALUES ('22', '24', '20', '2017-05-10 19:59:22', '<p><br/><img src=\"http://127.0.0.1:8080/gltraffic/umeditor/dialogs/emotion/images/jx2/j_0001.gif\"/></p>', null, '1');
INSERT INTO `messageboard` VALUES ('23', '24', '20', '2017-05-10 19:59:22', '<p><br/><img src=\"http://127.0.0.1:8080/gltraffic/umeditor/dialogs/emotion/images/jx2/j_0001.gif\"/></p>', null, '1');
INSERT INTO `messageboard` VALUES ('24', '20', '20', '2017-05-10 19:59:24', '<p><br/><img src=\"http://127.0.0.1:8080/gltraffic/umeditor/dialogs/emotion/images/jx2/j_0001.gif\"/></p>', null, '0');
INSERT INTO `messageboard` VALUES ('25', '20', '20', '2017-05-10 20:01:17', '<p>1111111111111<br/></p>', null, '0');
INSERT INTO `messageboard` VALUES ('26', '20', '20', '2017-05-10 20:03:04', '<p>123<br/></p>', null, '0');
INSERT INTO `messageboard` VALUES ('27', '20', '20', '2017-05-10 20:05:08', '<p><br/><img src=\"http://127.0.0.1:8080/gltraffic/umeditor/dialogs/emotion/images/jx2/j_0001.gif\"/></p>', null, '0');
INSERT INTO `messageboard` VALUES ('28', '20', '20', '2017-05-13 10:48:36', '<p>最近过得好吗？<img src=\"http://127.0.0.1:8080/gltraffic/umeditor/dialogs/emotion/images/jx2/j_0014.gif\"/></p>', null, '0');
INSERT INTO `messageboard` VALUES ('29', '22', '27', '2017-06-02 16:20:34', '<p>厉害了我的哥<img src=\"http://windows10.microdone.cn:8080/gltraffic/umeditor/dialogs/emotion/images/jx2/j_0001.gif\"/></p>', null, '0');
INSERT INTO `messageboard` VALUES ('30', '22', '22', '2017-06-02 16:25:07', '<p><img src=\"http://windows10.microdone.cn:8080/gltraffic/umeditor/dialogs/emotion/images/jx2/j_0013.gif\"/></p>', null, '0');
INSERT INTO `messageboard` VALUES ('31', '27', '22', '2017-06-04 00:05:57', '<p><br/><img src=\"http://127.0.0.1:8080/gltraffic/umeditor/dialogs/emotion/images/jx2/j_0001.gif\"/></p>', null, '1');

-- ----------------------------
-- Table structure for myfollow
-- ----------------------------
DROP TABLE IF EXISTS `myfollow`;
CREATE TABLE `myfollow` (
  `follow_userid` int(11) NOT NULL,
  `follow_topicid` int(11) NOT NULL,
  `follow_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`follow_userid`,`follow_topicid`),
  KEY `fk_follow_userid` (`follow_userid`),
  KEY `fk_follow_topicid` (`follow_topicid`),
  CONSTRAINT `fk_follow_topicid` FOREIGN KEY (`follow_topicid`) REFERENCES `topic` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_follow_userid` FOREIGN KEY (`follow_userid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of myfollow
-- ----------------------------
INSERT INTO `myfollow` VALUES ('20', '402', '2017-04-22 20:47:03');
INSERT INTO `myfollow` VALUES ('20', '406', '2017-04-20 00:08:47');
INSERT INTO `myfollow` VALUES ('20', '439', '2017-04-30 14:38:04');
INSERT INTO `myfollow` VALUES ('20', '474', '2017-05-12 23:20:48');
INSERT INTO `myfollow` VALUES ('20', '478', '2017-06-01 15:44:19');
INSERT INTO `myfollow` VALUES ('20', '493', '2017-06-03 23:37:26');
INSERT INTO `myfollow` VALUES ('22', '496', '2017-06-02 16:05:55');
INSERT INTO `myfollow` VALUES ('25', '347', '2017-04-13 13:59:31');
INSERT INTO `myfollow` VALUES ('27', '467', '2017-05-06 15:29:11');
INSERT INTO `myfollow` VALUES ('27', '478', '2017-05-25 08:33:54');
INSERT INTO `myfollow` VALUES ('27', '493', '2017-06-02 14:57:26');
INSERT INTO `myfollow` VALUES ('27', '509', '2017-06-15 13:20:52');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notice_tiltle` varchar(30) DEFAULT NULL,
  `notice_content` text,
  `notice_public_userid` int(11) DEFAULT NULL,
  `notice_public_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `notice_readed` int(11) DEFAULT NULL,
  `notice_state` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notice_public_userid` (`notice_public_userid`),
  CONSTRAINT `notice_ibfk_1` FOREIGN KEY (`notice_public_userid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('8', '异地闯红灯处罚规定', '<p><span style=\"font-size:18px\"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 引言：</strong>闯红灯是指机动车在信号控制的交叉路口和路段上违反红灯<span style=\"font-size: 18px;\"></span>相位禁止通行规定，越过停止线并继续行驶的行为。公安部最新修订发布《机动车驾驶证申领和使用规定》，违反道路交通信号灯通行为违法记分由3分提高到6分。</span></p><p><span style=\"font-size:18px\">	　<strong>　比如</strong></span></p><p>	<span style=\"font-size:18px\"><strong>　　安徽车在上海闯红灯怎么处罚，主要内容如下：</strong></span></p><p><span style=\"font-size:18px\">	　<strong>　旧规定：</strong>依据《中华人民共和国交通安全法实施条例》第 38、39、40、41、42、43条，机动车闯红灯的交通违法行为的处罚标准是罚款200元，扣3分。</span></p><p><span style=\"font-size:18px\">	　<strong>　新规定：</strong></span></p><p><span style=\"font-size:18px\">	　　1、根据最新修订的《机动车驾驶证申领和使用规定》，闯红灯，记6分，罚100元。公安部最新修订发布《机动车驾驶证申领和使用规定》，违反道路交通信号灯通行为违法记分由3分提高到6分。</span></p><p><span style=\"font-size:18px\">	　　2、最新<a href=\"http://undefined\" target=\"_blank\" class=\"Key_word\"><span style=\"font-size:18px\">交通法规</span></a>中关于校车驾驶人管理的内容自发布之日起施行，其他规定将于2013年1月1日起正式施行。即是闯红灯扣6分从2013年1月1日起正式施行。</span></p><p>	<span style=\"font-size:18px\"><strong>　　2013年最新交规关于闯红灯的处罚规定</strong></span></p><p><span style=\"font-size:18px\">	　　2013年1月1日起将<a href=\"http://undefined\" target=\"_blank\" class=\"Key_word\"><span style=\"font-size:18px\">执行</span></a>的“驾驶证管理新规”，提高了闯红灯处罚力度，扣分从3分提高到6分。两次闯灯，就得重新考试。昨天，交管部门表示，司机在刚变红灯时没刹住车过线，视频设备一般不会记录为闯灯。但需要注意的是，刚过线的车辆不要冲线或者倒车，视频设备将拍摄车辆移动形成一次完整的违法记录。</span></p><p><span style=\"font-size:18px\">	　　公安部修订发布了《机动车驾驶证申领和使用规定》(公安部令第123号，以下简称“123号令”)。123号令中关于校车驾驶人管理的内容自发布之日起施行，123号令中的其他规定将于2013年1月1日起正式施行。新规中的一大变化，是加大对严重违法行为的处罚力度，其中故意遮挡号牌由扣6分提高到扣12分;违反交通信号灯扣分由3分提高到6分。</span></p><p><span style=\"font-size:18px\">	　　闯红灯是严重的交通违法行为，一贯以来处罚力度就很大。很多驾驶员担心，压线被拍摄以后，会被扣分。</span></p><p><br/></p>', '27', '2017-05-22 11:35:03', '9', '0');
INSERT INTO `notice` VALUES ('9', '私家车通行应急车道算违法', '<p>　高速公路发生拥堵，车辆纷纷占用应急车道通行，造成应急车道也被堵死，类似情况并不少见。高速交警集中开展占用应急车道交通违法行为整治，对于违法驾驶员，罚款200元扣6分。也就是说，只要两次占用应急车道挨罚，记满12分，驾驶证将面临吊销。</p><p>	<strong>　　占用应急车道堵死高速路</strong></p><p>	　　30日上午11点30分，京港澳高速水渡河路段一辆鄂A牌照的红色小车因为前方有两台大货车并排行走，占据了行车道和超车道。小车毫不犹豫地从右侧应急车道超车，民警使用移动执勤设备抓拍下违法行为，通知前方收费站民警拦截处罚。</p><p>	　　“占用应急车道违法行为已成为影响高速公路安全畅通的顽疾。”临长大队大队长蒋满生说，临长高速公路是京港澳线湖南段最长路段，拥堵经常发生。发生<a href=\"http://undefined\" target=\"_blank\" class=\"Key_word\">交通事故</a>后，因违法占用应急车道，造成警车、施救车、急救车、消防车无法及时到达现场，严重影响事故勘处救援，造成更长时间拥堵。</p><p>	　<strong>　发现占道请手机拍图举报</strong></p><p>	　　针对占用应急车道交通违法突出的情况，春运期间临长大队将利用警务“一网通”，配备警车在堵点中段来回巡逻，对占用应急车道的违法车辆进行查处。“ 新增5个监控探头，将24小时不间断对占用应急车道的违法行为进行抓拍。”</p><p>	　　在堵塞区域对占用应急车道的违法行为，则采取前端抓拍、后端拦截处罚的方式进行，在岳阳、星沙、羊楼司等重点收费站设立拦截系统，对抓拍的违法行为进行拦截处罚。</p><p>	　　“行经高速路时，发现违法占用应急车道的行为，乘客可以通过手机抓拍并举报。”高速交警广泛发动群众举报、纠正违法，对使用摄录设备记录的违法行为，临长大队通过法制审核后将录入违法系统。</p><p>	<strong>　　交警析误</strong></p><p>	<strong>　　事故拥堵就能借用应急车道?</strong></p><p>	　　蒋满生说，很多驾驶员误认为，只要前方发生拥堵或事故，就可以顺理成章地借用应急车道通行，这其实是违法的。</p><p>	　　事实上，应急车道是为公众设立的救援专门通道。一般情况下，只有处警的警车、<a href=\"http://undefined\" target=\"_blank\" class=\"Key_word\">执行</a>救援的消防车、急救车、施救车及工程车才能通行。一旦发生大的拥堵及事故，交警赶赴现场实施<a href=\"http://undefined\" target=\"_blank\" class=\"Key_word\">管制</a>，指挥车辆从应急车道通行时，才能免罚借用应急车道。</p><p>	　<strong>　交通连线</strong></p><p>	<strong>　　今年长沙还将新增一批禁停路段</strong></p><p>	　　2012年治堵，长沙中心城区早晚高峰车速由治堵前的14公里每小时提高到了21.2公里每小时。今晚召开的全市公安交通管理工作会议上，交警支队支队长徐波跃表示，2013年，治堵仍然是长沙交警第一要务。</p><p>	　　今年，全市还将新增一批禁停路段。全市交警部门将对电的、闯禁摩托、货车、饮酒驾驶、无牌套牌及公交、的士乱停乱行等突出交通违法行为进行严罚。</p><p>	　　同时，将通过实施文明交通行动等计划，提升全市广大交通参与者的素质，着力改变“中国式过马路”等现象。</p><p>	　　将进一步规范服务流程，简化办事程序，所有窗口业务能就近办的就近办，能在网上办的就在网上办。改变窗口服务单位电话打不通、无人接的情况，所有对外服务电话实行专人管理。</p><p><br/></p>', '27', '2017-05-22 11:38:34', '10', '0');
INSERT INTO `notice` VALUES ('10', '驾车十大交通规则', '<p style=\"text-align: center\">	<a href=\"http://undefined\" target=\"_blank\"><img alt=\"新交通规则\" src=\"http://img.findlawimg.com/info/2013/0529/20130529044049489.jpg\" style=\"width: 450px; height: 338px\" title=\"2013开车避让新规则\"/></a></p><p>	　　<strong>十大交通规矩，规范自己的驾车行为</strong></p><p>	<strong>　　1、进入主路</strong></p><p>	　　主要现象：城市快速公路，从辅路进入主路，随即往左并线，好一点的，是先并到中间车道，更为勇猛的，是直接切过两条车道，并线到快车道上。</p><p>	　　造成后果：如果此时后面没有来车，倒也平安无事，但如果后面有车来，这样的驾驶动作，就逼迫后车不得不立即减速，伴随着的，是发生追尾事故的隐患。</p><p>	　　正确做法：进入主路后，沿最外侧车道行驶一段距离，逐渐加速，直到把速度加到，与主路原有行驶车辆吻合的时候，再根据需要，决定是否往里并线。</p><p>	　　小建议：交通管理部门，应该在每个入口内，都规划出足够长的加速车道。</p><p>	　<strong>　2、出主路</strong></p><p>	<strong>　　强行驶出主路</strong></p><p>	　　主要现象：行驶在城市快速公路或高速公路上，距离出口已经相当近了，才想起往外并线，于是不管不顾，减速打轮。更有甚者，把车开到几乎与出口平行的位置上了，才从最里侧的快车道上，向右做90度直角转弯，横切三条主干道，把车开出主路。</p><p>	　　造成后果：您老人家是出去了，被你拦住的几条车道都陷于了暂时的停顿状态。交通就是流动，在高峰的时候，一辆车一个10秒钟的停顿，都可能带来后面连绵百米，数百辆车长达几分钟的停顿。事实上，北京二、三、四环路，由于这种驾驶动作的存在，而经常陷于拥挤。</p><p>	　　正确做法：距离出口500米的时候，用比原有速度略微低一点的车速，逐车道地向外并线，保证在距离出口100-200米的时候，车已经行驶在了出口车道上，进入出口车道之后，再把车速彻底降低，以保证安全出主路，同时又不影响主路各车道的流动。</p><p>	　　小建议：管理部门在每个出口设立1000米、500米的提示牌;在每个出口车道上，施画100米的实线，杜绝上述现象的发生。</p><p>	　<strong>　3、减少车道</strong></p><p>	　　主要现象：道路行驶，由于故障、事故、施工、作业等原因，车道忽然减少的时候，很多驾驶者互不相让，个个奋勇当先，似乎全都有十万火急的事情需要处理。于是，一个死疙瘩形成了。</p><p>	　　造成后果：死疙瘩形成容易，化解就得需要时间了，拥堵的时间反而会延长，十万火急的事情反而难以去处理。</p><p>	　　正确做法：在减少车道的瓶颈处，各位驾驶者自觉地采用轮流制，一边一辆依次通过。</p><p>	　　小建议：这条规则已经被写进了交通法规，目前需要的是有措施保证实施，对于违反游戏规则者，应该有处罚措施。比如对于加塞者，罚其靠边停车休息，30分钟后方准离去。</p><p>	<strong>　　4、路口起步</strong></p><p>	　<strong>　路口变灯后 要尽快通过 提高通行效率</strong></p><p>	　　主要现象：也不知道是真着急还是假着急，路口红灯变绿，不慌不忙地挂上档、松开手刹，温柔地踏下油门，车子徐徐启动。这样还没等过去几辆车，绿灯又变红了。</p><p>	　　造成后果：交通就是流动。该您走您就得快点，都这么慢吞吞的，四个现代化什么时候才能实现尚且不说，路口的车龙越来越长可是眼前就能瞧见的。</p><p>	　　正确做法：跟你垂直的路口开始闪灯了，就可以踩离合挂档，你这边只要变了绿灯，松开手刹跟上油，车子很快就能驶过路口。</p><p>	　　小建议：现在驾驶证考试增加了百米之内加减档，我看太有必要了，可以考虑再训练训练每位驾驶者的瞬间起步和眼观六路。交通协管员应该把行人骑车人控制住，不该他们走的时候，车道上就不该出现他们的身影。因为行人骑车人往往是影响路口通行能力的祸首，针对这个问题，能出台针对行人、骑车人违章的处罚措施并保障实施就是最好的事情了。</p><p>	　<strong>　5、道路划分</strong></p><p>	　　主要现象：我们的道路至今仍以车种分道，小汽车车道、混合车道、大型车车道。事实上，小汽车的动力性能虽然优越，但它的快慢最终取决于驾驶它的人。我们经常可以看到明显慢于车流的小汽车，按照现行交通法规，它没有违章，但它给造成的拥堵更甚于超速的车辆。</p><p>	　　造成后果：浪费道路资源，影响交通。</p><p>	　　正确做法：您不打算把车开到80公里时速的时候，不妨就在最外侧车道里，别往里并线了。因为不是每个人都打算陪着您在道路上踱步、赏景。</p><p>	　　小建议：道路不应再以车种划分(公交车道除外，公共汽车理应有专用道路)而应该以速度划分，比如，可以按80Km/h、60Km/h、40Km/h三种速度，分出三条车道。超速是违章行为，低速行驶同样属于违章行为，因为交通就是流动。</p><p>	　<strong>　6、人行横道</strong></p><p>	<strong>　　礼让斑马线是基本公德</strong></p><p>	　　主要现象：很多道路都划了人行横道线，但这线有何用?你见过有几辆汽车能在线前主动停下以让行人安全通过?非但如此，偶尔遇到一位文明驾驶者停车礼让，后面的车便不是晃大灯，就是按喇叭，仿佛家里有病危者需要去救护。行人们也有很多无视人行横道的存在而任意穿行，有部分遵守规则的市民，见人行横道线不起作用也就不再重视它的存在。</p><p>	　　造成后果：这种恶性循环的根本原因在于：一是多数人行横道线旁没有信号灯;二是交通法规对于人、车事故的处理有不公平的倾向，坚定了行人违章的信心。</p><p>	　　正确做法：见到人行横道内有人，驾驶者就应该停下车，让行人先过。这在很多国家已经是司空见惯的事情了。可中国确实人多，有人担心这样做，汽车就停在那里别动了。所以不妨来个小的变通，如果你身后没有汽车，你的车速又比较高，就顺势一给油过去吧，如果身后有一大串汽车呢，就应该毫不犹豫地立即停车。</p><p>	　　小建议：上策，尽可能多地建设过街天桥过街地道，实现人车分流。中策，人行横道都应设立信号灯。下策，弄个电子监控装置，谁不礼让行人，算违章，扣分罚款。还有，别再弄出什么伪善的“强势”“弱势”的弱智交通法规，助长行人骑车人无视安全的行为。该尊重人权的时候那些专家死哪去了?</p><p>	<strong>　　7、无征兆的突然停车</strong></p><p>	　　主要现象：很多驾驶者都会遇到这样的经历：前面的车不知何时突然一脚刹车，停在行车道内，这种事发生概率最高的，是出租车，因为是有乘客拦截出租车。</p><p>	　　造成后果：后车如果跟车距离近，反应慢一点，追尾是一定的了。</p><p>	　　正确做法：只要不是不踩急刹车，就会追尾或撞人，就应该避免踩急刹车，为他人想想，一脚急刹下去，后面的车怎么办?出租车为了乘客上车而突然刹车就更是不对了。</p><p>	　　小建议：交通管理部门是否可以考虑，此类事件导致追尾，责任由前车负全责。那样不会再有谁敢于冒此险，挨了撞还要赔钱给撞他的人。当然，这事的可操作性还需要做进一步研究，主要是如何界定的问题。</p><p>	　<strong>　8、灯光使用</strong></p><p>	<strong>　　夜晚乱开远光灯于人于己都很危险</strong></p><p>	　　主要现象：1，不管道路照明设施有多好，远光灯永远亮着;2，不管有没有雾，前后雾灯伴随着大灯一直开着;3，进出有人值守的大门或进出狭窄的胡同，不懂得临时关闭大灯;4，并线、转弯或进出主路，不懂得事先打转向灯;5，正常行车无故开双闪灯。</p><p>	　　造成后果：有事没事总开着远光，您的视线是好了，可对面的车呢，就不为迎面而来的驾驶者考虑考虑?前雾灯倒还影响不大，后雾灯就招人讨厌了，没雾的天气开着后雾灯，晃着后面的驾驶者，特难受。进出大门临时关大灯，这是起码的道德，对人家是一种尊重。并线转弯不开转向灯，离追尾刮蹭就不远了，名副其实地马路杀手。</p><p>	　　正确做法：城市道路行驶，远光灯的作用其实很小，能不开尽量别开，遇见门卫等，最好把大灯临时关一会。在并线、转弯、进出主路，一定要提前打开转向灯，最少闪三下后，再打轮。双闪是为了紧急停车的时候预备的，不是特权灯，别拿双闪当警灯用，即使是多辆车编队行驶，也没有开启双闪灯的法律依据。把双闪灯当作特权灯使用的人，自我感觉可能还挺好，旁边懂行的人看了，就一个感觉：傻。</p><p>	　　小建议：什么大灯增亮器等东西，就应该禁止销售，警察对行驶中的车辆，其灯光使用应有严格的规定、宣传及监督。政府、军队的负责人，管好你们手下的司机，让他们明白自己的身份，别老狐假虎威的，上了路就把双闪灯开个不停，替自己和这个政府挣足了骂名。</p><p>	<strong>　　9、喇叭使用</strong></p><p>	　　主要现象：倒退十几年前，外地人很羡慕北京安静的城市道路，可现在呢，喇叭声连续不断，最近五年以来，北京开车按喇叭似乎成了一种时尚。我见过很多驾驶者，只要行驶前方有人有车，甭管人家碍没碍着他的事，喇叭声就永远不停。真叫一个闹。</p><p>	　　造成后果：越是文明的国家，就越听不见喇叭声。做为驾驶者，应该从这三方面，找出自己按喇叭的原因，一是手太潮，对自己的驾车水平根本没有信心;二是不安全意识过于强烈，对路上的任何一辆车任何一个人都抱以不放心的思想;三是以我为尊的霸权思想，认为只要他走在这路上，别人就得回避退让，你要是没有这个意思，他就狂按喇叭不止;</p><p>	　　正确做法：少按喇叭，最好不按喇叭。有人说，不按喇叭出事怎么办?其实，这是一个心态与技术相结合的问题。喇叭按多了，汽车与行人有时候比较对立，还容易引起逆反心理呢。至于车与车，更是没有按喇叭的必要了。我经常看到并线的时候，后车按喇叭，其实路权是全民拥有的，这路不是你一个人的，人家要并线近来，只要不是加塞、只要不是硬冲，后车稍微一收油或一个轻微的刹车，问题也就解决了。非按几下喇叭有什么用?</p><p>	　　小建议：严格管理!80年代中末期，北京城市道路，只要按喇叭就会被处罚，那时候路上就比较安静，现在警察都不管了，喇叭声自然大了许多。</p><p>	　<strong>　10、谁有优先权</strong></p><p>	<strong>　　明确路权 熟记交法</strong></p><p>	　　驾驶中有个很重要的原则，优先通过权。比如，在三条车道的道路上，一辆车在最外道，一辆车在最里道，俩车同时往中间车道并线的话，左侧汽车需要礼让右侧的汽车，也就是说，位于右侧车道里的车子，此时有优先通过的权力。如果俩车在同时往中间车道并线时，发生了刮蹭，警察会判左侧汽车承担主要责任。同样道理，当您驾车进入环岛时，需要注意礼让环岛内的车子，因为此时，环岛内的车拥有优先通过权。</p><p>	　　城市的进步不光是高楼大厦有多少，汽车增加了多少辆，社会道德意识的培养才是最重要的。可谓物质文明、精神文明两手都要抓。中国社会最匮乏的，是社会公德。甭管是穷乡僻壤的村长、村干部，还是大城市里的市长、公务员;甭管是乡间的农妇，还是大厦里的白领。在社会公德这个话题前面，几乎都处于小学没必要的水准。同样，汽车进入家庭仅仅几年的光景，行车道德自然匮乏得更为严重。</p><p>	　　行车道德的树立，需要以完善而合理的法规为后盾，严格而公平的执行为手段。当现代交通意识贯穿于每个人心中时，才能换来良好的交通环境。很多国家进行了不遗余力宣传、教育再加上完善的法规和严厉地执法。我们也走到这一步了，虽晚了点，但总比保持现状强。</p><p>	　<strong>　再列举几条随处可见的不文明驾驶行为：</strong></p><p>	　　乱扔杂物：很多驾驶者都有过这样的遭遇，自己在正常行驶，前面的老兄一会儿从车里扔出个可乐罐，一会儿扔出个塑料袋，或是吐口痰。后车只好开始躲闪行动，躲好了还成，躲不好可就得剐上旁边的车了。</p><p>	　　并线不打灯：有的驾驶者，总觉得路上就他一人，无论拐弯、并线，一律不打灯。或者遇上个别出租司机，他们一旦发现有乘客招手就会连反光镜也不看就紧急停车，结果就经常导致后面的车辆和行人险象环生。</p><p>	　　开车打电话：驾驶过程中，无论是处于行车状态还是堵塞状态，都不应打电话或发短信，这样做的结果，肯定是分散了你的注意力，影响到你的注意力，对安全驾驶是有害的。</p><p>	　　过坑不慢行：驾驶者在通过泥坑、水坑时应注意减速慢行，避免将泥水溅到行人身上。其实雨雪天路况复杂，有些泥坑深浅难判，提前减速也是对自己的安全负责。</p><p><br/></p>', '27', '2017-05-22 11:41:43', '22', '0');
INSERT INTO `notice` VALUES ('11', '整治低俗语言，净化网络环境', '<div id=\"p_content\" class=\"clearfix\"><p style=\"text-indent: 2em\">	昨日，在国家互联网信息办公室指导下，中国文化网络传播研究会主办召开净化网络语言主题座谈会。会上，人民网舆情研究室发布的网络低俗粗鄙语言的报告显示，“尼玛”、“屌丝”和“逗比”位列前三。国家网信办副主任彭波表示，净化网络语言环境，不是防民之口，而是为我所用，改变堵的办法，用疏的措施营造文明理性的网络空间。（6月3日，新京报）</p><p style=\"text-indent: 2em\">	当前，网络信息泥沙俱下，网络语言也是五花八门，其中包含了一些积极向上的正能量，也有着一些比较消极的“尼玛”、“屌丝”、“逗比”等低俗语言。这些网络语言，其运用不仅仅局限于虚拟的网络空间，而且是直接延伸到了社会生活当中。</p><p style=\"text-indent: 2em\">	语言是人们传达、交流思想的工具，网络语言也具有这种属性，但是，网络空间的虚拟性、传递信息的广泛性，参与主体的多元性，使得网络语言呈现出了一种多元、复杂的特征。</p><p style=\"text-indent: 2em\">	存在的不一定就是合理的。网络空间作为现实生活的延伸扩展，网络环境和现实环境之间也存在着能量场的相互作用和相互影响。负面的网络语言不仅是受到社会环境的影响，也反过来对于社会环境会产生“污染”。整治网络低俗语言，不仅是净化网络空间的题中之义，也是净化现实社会环境的应然举措。</p><p style=\"text-indent: 2em\">	净化网络语言，堵是一方面，但是单方的堵只是一种应急性的治标之策。为从根本上铲除低俗网络语言的“病灶”，就需要厘清低俗网络语言的产生根源与运行机制。</p><p style=\"text-indent: 2em\">	首先，从网络语言的产生根源来看。网络语言是现实生活的反映。对于网络上的一些低俗卑鄙语言，我们要弄清楚它产生的现实根源，进而采取有效对策，才能够从根本上遏止网络低俗语言滋生的现实土壤，让网络空间更加风清气正。</p><p style=\"text-indent: 2em\">	其次，从网络语言的运行机制来看。网络语言是网民心态的一种放大化反映。由于网络生活的去个性化、去角色化，往往使得网络语言具有一种偏激、片面的表达方式，而这种表达方式又更容易被广大网民所认可、接受，并且由于网络的便捷性、实时性使得低俗网络语言得以在网路上快速、广泛的传播。</p><p style=\"text-indent: 2em\">	依笔者之见，整治网络低俗语言，需从“线上”和“线下”齐发力。一方面，需要着力于解决各种社会问题，缓解社会矛盾，消除低俗网络语言的现实根源。另一方面，需要政府部门、媒体做好网络舆论的引导工作，多多宣传正能量，引导广大网民客观、理性的看待社会事物特别是社会问题、社会矛盾。</p><p style=\"text-indent: 2em\">	总之，社会转型期矛盾多元复杂，而网络其实不过是现实生活中的矛盾问题在网络平台上的反映。利用好网络平台，净化网络空间，这也是对于人们心灵的一种深度净化。</p></div><p><br/></p>', '27', '2017-06-02 15:11:50', '6', '0');

-- ----------------------------
-- Table structure for topic
-- ----------------------------
DROP TABLE IF EXISTS `topic`;
CREATE TABLE `topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_tiltle` varchar(200) DEFAULT NULL,
  `topic_content` text,
  `topic_public_userid` int(10) NOT NULL,
  `topic_images` text,
  `topic_egg` int(11) NOT NULL DEFAULT '0',
  `topic_public_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `topic_type` varchar(6) DEFAULT NULL,
  `topic_last_updatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `topic_readed` int(10) NOT NULL DEFAULT '0',
  `topic_state` int(11) NOT NULL DEFAULT '0',
  `topic_location` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_topic_userid` (`topic_public_userid`),
  CONSTRAINT `fk_topic_userid` FOREIGN KEY (`topic_public_userid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=510 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of topic
-- ----------------------------
INSERT INTO `topic` VALUES ('299', '324', '234', '20', 'b.jpg|', '4', '2017-02-26 15:32:55', '曝光', '2017-05-05 10:40:56', '65', '0', '象山区');
INSERT INTO `topic` VALUES ('300', '', '', '20', 'ab43f7e0-29e4-46ff-835b-82e4c0cc7f92.jpg|', '6', '2017-02-26 15:36:31', '曝光', '2017-05-05 10:40:56', '2', '0', '象山区');
INSERT INTO `topic` VALUES ('301', '34567890-09876543234', '34567890-0987654323434567890-0987654323434567890-0987654323434567890-0987654323434567890-0987654323434567890-0987654323434567890-0987654323434567890-0987654323434567890-0987654323434567890-0987654323434567890-0987654323434567890-0987654323434567890-0987654323434567890-0987654323434567890-0987654323434567890-0987654323434567890-0987654323434567890-0987654323434567890-0987654323434567890-0987654323434567890-0987654323434567890-0987654323434567890-0987654323434567890-09876543234', '20', '2a73bb46-d8f4-45a0-bf73-1b9c522b4f2a.jpg|7279e55d-8820-4418-a76a-24ecb48aa527.jpg|', '29', '2017-02-26 16:52:10', '曝光', '2017-05-05 10:40:56', '2', '0', '象山区');
INSERT INTO `topic` VALUES ('302', '', '324234234234', '20', '450ffd90-8448-45dc-92c9-c3f0300c1ec2.jpg|d0037397-b592-4382-a403-0120660a9a71.jpg|', '5', '2017-03-02 23:51:41', '曝光', '2017-05-12 22:22:20', '22', '0', '象山区');
INSERT INTO `topic` VALUES ('303', '423423423', '4234234444444444444444324', '20', '', '1', '2017-03-05 18:12:53', '曝光', '2017-05-05 10:40:56', '0', '0', '象山区');
INSERT INTO `topic` VALUES ('312', '34234', '23423', '20', 'd8ac1406-36ce-4828-8935-6d225eca70cc.jpg|', '2', '2017-03-06 22:44:18', '曝光', '2017-05-05 10:40:56', '0', '0', '象山区');
INSERT INTO `topic` VALUES ('313', '', '', '20', 'f28d8598-b6cf-4284-a398-2737a5103b72.jpg|09374a3d-2d36-400d-a9ef-127b9228a6c6.jpg|1a12d7c8-0870-43d5-b4a7-fb2e991a0739.jpg|', '27', '2017-03-06 22:44:52', '曝光', '2017-05-05 10:40:56', '0', '0', '象山区');
INSERT INTO `topic` VALUES ('314', '', '', '20', '07a03c51-15a0-4697-bbf5-18a2d371aee4.jpg|96d88a14-7439-478d-95bc-d2f124273bd6.jpg|210cc7d0-14b7-46e2-82c4-7120f17650fe.jpg|', '20', '2017-03-06 22:45:38', '曝光', '2017-05-05 10:40:56', '0', '0', '象山区');
INSERT INTO `topic` VALUES ('315', '', '', '20', '39523bd0-1ef2-4084-8199-54180e11374e.jpg|', '0', '2017-03-12 16:10:23', '曝光', '2017-05-05 10:40:56', '0', '0', '象山区');
INSERT INTO `topic` VALUES ('316', '', '', '20', '8b97f74b-3841-4a1d-8e70-cbd570771ee7.jpg|', '0', '2017-03-12 16:12:56', '曝光', '2017-05-05 10:40:56', '0', '0', '象山区');
INSERT INTO `topic` VALUES ('317', '', '', '20', '', '0', '2017-03-12 16:13:17', '曝光', '2017-05-05 10:40:56', '0', '0', '象山区');
INSERT INTO `topic` VALUES ('318', '', '好烦啊<br>', '20', '', '0', '2017-03-12 16:16:45', '曝光', '2017-05-05 10:40:56', '0', '0', '象山区');
INSERT INTO `topic` VALUES ('319', '', '', '20', '', '0', '2017-03-12 16:16:52', '曝光', '2017-05-05 10:40:56', '0', '0', '象山区');
INSERT INTO `topic` VALUES ('320', '', '好吧！<br>', '20', '', '0', '2017-03-12 16:17:14', '曝光', '2017-05-05 10:40:56', '0', '0', '象山区');
INSERT INTO `topic` VALUES ('321', '', '不停的发会怎么样》<br>', '20', '', '11', '2017-03-12 16:17:31', '曝光', '2017-05-05 10:40:56', '15', '0', '象山区');
INSERT INTO `topic` VALUES ('322', '', 'vb kc <br>', '20', 'd0aa9b67-6684-4200-9bed-3e903be8be43.jpg|', '0', '2017-03-12 16:25:00', '曝光', '2017-05-05 10:40:56', '0', '0', '象山区');
INSERT INTO `topic` VALUES ('325', '', '90', '23', '4830f10c-703b-4152-b936-427b88072627.jpg|', '0', '2017-03-14 11:40:48', '曝光', '2017-05-05 10:40:56', '0', '0', '象山区');
INSERT INTO `topic` VALUES ('326', '', '15', '23', '84e272b2-dc54-430d-9e51-c8e7ad846543.jpg|', '0', '2017-03-14 11:43:18', '曝光', '2017-05-05 10:40:56', '0', '0', '象山区');
INSERT INTO `topic` VALUES ('331', '', '<img src=\"arclist/20.gif\">', '20', '', '0', '2017-03-15 15:20:55', '曝光', '2017-05-05 10:40:56', '0', '0', '象山区');
INSERT INTO `topic` VALUES ('332', '', '特别恶心是吧，你们觉得呢？', '20', '6f9227f7-efef-4ff4-b316-a8de41f5a238.GIF|', '14', '2017-03-23 23:02:46', '曝光', '2017-05-05 10:40:56', '2', '0', '象山区');
INSERT INTO `topic` VALUES ('334', '', '唉<br>', '20', '4a60075b-164b-43cd-8d73-d62c36bb4866.jpg|e6235723-c2fb-4b22-9696-4aee9bc1d68d.jpg|460953e3-9bbf-4de9-8144-2c14c9e431ea.jpg|7f1f42ba-4b08-4eb6-b696-468a1bfdc031.jpg|1c8416c7-df8a-4dcf-8646-59c831ec0009.jpg|580e6050-d7fd-467a-a5c3-a614e4bf3640.jpg|', '2', '2017-04-12 11:07:50', '闲聊', '2017-05-05 10:40:56', '0', '0', '象山区');
INSERT INTO `topic` VALUES ('335', '', 'gfgsfg', '20', '0d2eeb04-9aec-4840-a84d-33570b65e527.mp4|', '13', '2017-04-12 16:53:59', '曝光', '2017-05-05 10:40:56', '0', '0', '象山区');
INSERT INTO `topic` VALUES ('347', '', '?????????????', '25', '2c597721-bb89-458c-a055-a3141ad62f41.jpg|1f5abfff-927e-4f0e-98c7-8602d04853c8.jpg|', '0', '2017-04-13 13:54:21', '曝光', '2017-05-05 10:40:56', '0', '0', '象山区');
INSERT INTO `topic` VALUES ('364', '', '草草楉进地可研民地地于钩沉人霜叶 奇百十一地<br>', '22', '', '0', '2017-04-14 09:22:30', '曝光', '2017-05-05 10:40:56', '0', '0', '象山区');
INSERT INTO `topic` VALUES ('365', '', '虽迷你超短苦我为什么要等才可以看到自己发的内容呢？？？？？<br><img src=\"arclist/37.gif\">', '22', '', '1', '2017-04-14 09:24:44', '曝光', '2017-05-05 10:40:56', '0', '0', '象山区');
INSERT INTO `topic` VALUES ('366', '', '？？？？？？？？？？？？？？？？？？？？？？地', '22', '', '0', '2017-04-14 09:33:49', '曝光', '2017-05-05 10:40:56', '0', '0', '象山区');
INSERT INTO `topic` VALUES ('367', '', '213123', '22', '2c3a9a18-64cc-4c55-af91-670d1056651f.jpg|', '0', '2017-04-14 09:34:38', '曝光', '2017-05-05 10:40:56', '0', '0', '象山区');
INSERT INTO `topic` VALUES ('368', '', '21321', '22', '', '0', '2017-04-14 09:40:10', '曝光', '2017-05-05 10:40:56', '0', '0', '象山区');
INSERT INTO `topic` VALUES ('369', '', '5163532', '22', '4feb667c-edbf-4f5e-b30a-a0dc35a6e66d.jpg|', '0', '2017-04-14 09:40:53', '曝光', '2017-05-05 10:40:56', '0', '0', '象山区');
INSERT INTO `topic` VALUES ('370', '', '3562', '22', '83632a1a-d9d1-4312-915c-5a42a992daff.jpg|', '0', '2017-04-14 09:44:24', '曝光', '2017-05-05 10:40:56', '0', '0', '象山区');
INSERT INTO `topic` VALUES ('371', '', '吉好好九龙山发发绝世双娇', '22', '0aa74f3c-21a1-43e1-9f59-6aeebb5cebc0.jpg|', '0', '2017-04-14 09:46:56', '曝光', '2017-05-05 10:40:56', '0', '0', '象山区');
INSERT INTO `topic` VALUES ('373', '', '就不联系', '20', '0bd48d44-e3a2-48d1-87f2-7ae1cf6d30d4.mp4|', '0', '2017-04-14 09:51:00', '曝光', '2017-05-05 10:40:56', '0', '0', '象山区');
INSERT INTO `topic` VALUES ('374', '', '好漂亮的仙人掌', '20', '17579d8a-55e1-44a7-b086-00a6c1b4c6fb.jpg|', '4', '2017-04-14 09:54:59', '曝光', '2017-05-05 10:40:56', '1', '0', '象山区');
INSERT INTO `topic` VALUES ('375', '', '2132', '22', '', '0', '2017-04-14 10:20:30', '曝光', '2017-05-05 10:40:56', '0', '0', '象山区');
INSERT INTO `topic` VALUES ('376', '', '312', '22', '', '0', '2017-04-14 10:20:43', '曝光', '2017-05-05 10:40:56', '0', '0', '象山区');
INSERT INTO `topic` VALUES ('377', '', '1321', '22', '30203c1d-2a48-4d65-9bd2-a033e311a2d4.jpg|', '0', '2017-04-14 10:21:43', '曝光', '2017-05-05 10:40:56', '0', '0', '象山区');
INSERT INTO `topic` VALUES ('379', '', 'dogadf<br>', '22', '7042bed1-9e55-4575-af2c-bde39e162601.jpg|', '0', '2017-04-14 10:23:45', '曝光', '2017-05-05 10:40:56', '2', '0', '象山区');
INSERT INTO `topic` VALUES ('380', '', '54654', '22', 'f2533878-1067-4c1b-a50b-28fa816e022c.jpg|', '0', '2017-04-14 10:24:51', '曝光', '2017-05-05 10:40:56', '0', '0', '象山区');
INSERT INTO `topic` VALUES ('381', '', '绿绿的叶子', '20', 'a8fd2926-c1db-4fcd-817d-b989c91e0a6f.jpg|', '0', '2017-04-14 10:27:03', '曝光', '2017-05-05 10:40:56', '0', '0', '象山区');
INSERT INTO `topic` VALUES ('382', '', '32', '22', 'e0640145-330c-4d57-9428-8a0b182f9ddc.jpg|', '0', '2017-04-14 10:29:06', '曝光', '2017-05-05 10:40:56', '0', '0', '象山区');
INSERT INTO `topic` VALUES ('384', '', '456456', '20', '', '0', '2017-04-14 12:24:50', '曝光', '2017-05-05 10:40:56', '0', '0', '象山区');
INSERT INTO `topic` VALUES ('385', '', '地顶替模压斯柯达<br>', '20', 'cbb3723c-9327-414a-84dc-51f711e07907.jpg|', '0', '2017-04-14 13:29:19', '闲聊', '2017-05-05 10:40:56', '0', '0', '象山区');
INSERT INTO `topic` VALUES ('386', '', '不为谁而亻的哥<br>', '20', '', '0', '2017-04-14 13:36:54', '曝光', '2017-05-05 10:40:56', '0', '0', '象山区');
INSERT INTO `topic` VALUES ('387', '', '15645312312', '20', 'f833bb8f-202c-4857-9cb1-2068807bce43.jpg|', '0', '2017-04-14 13:39:29', '曝光', '2017-05-05 10:40:56', '0', '0', '象山区');
INSERT INTO `topic` VALUES ('388', '', '4564564', '20', '', '0', '2017-04-14 13:39:36', '曝光', '2017-05-05 10:40:56', '0', '0', '象山区');
INSERT INTO `topic` VALUES ('389', '', '456456312645', '20', '', '0', '2017-04-14 13:39:43', '曝光', '2017-05-05 10:40:56', '0', '0', '象山区');
INSERT INTO `topic` VALUES ('390', '', '4564523123', '20', '', '6', '2017-04-14 13:39:51', '曝光', '2017-05-05 10:40:56', '0', '0', '象山区');
INSERT INTO `topic` VALUES ('392', '', '啦啦啦德玛西亚第一季', '20', 'ea0dda30-78cc-4ac0-851d-20b5e0ec8d6e.jpg|', '0', '2017-04-14 13:50:19', '曝光', '2017-05-05 10:40:56', '0', '0', '象山区');
INSERT INTO `topic` VALUES ('393', '', '三国之召唤猛将笔趣阁', '20', '', '0', '2017-04-14 13:55:02', '曝光', '2017-05-05 10:40:56', '0', '0', '象山区');
INSERT INTO `topic` VALUES ('394', '', '5163524165416351', '20', '', '0', '2017-04-14 13:58:20', '曝光', '2017-05-05 10:40:56', '0', '0', '象山区');
INSERT INTO `topic` VALUES ('396', '', '一个视频', '20', '7f6f4268-6026-4d08-af01-57bef72cfd53.mp4|', '0', '2017-04-14 14:04:17', '曝光', '2017-05-05 10:40:56', '0', '0', '象山区');
INSERT INTO `topic` VALUES ('401', '', '4456456', '22', '0ed06559-3d51-449c-9ec0-83906378b518.GIF|', '0', '2017-04-15 13:53:48', '曝光', '2017-05-05 10:40:56', '0', '0', '象山区');
INSERT INTO `topic` VALUES ('402', '', '234234', '20', 'd6a3039e-07d8-4e7f-a55c-c0567f35abe8.jpg|4be2eb92-8305-4270-97af-16dd87b3c9d2.jpg|61455061-21ff-457b-89c2-0e3463797683.jpg|8c5d5354-f3c8-4f3f-a972-15ecc69d9e0f.jpg|131781ee-d17b-40c8-afa9-0ad6ab2fc096.jpg|59a9a8b5-20ff-46e2-b214-b71686c3c0c9.jpg|ac05f7d5-3438-479a-bbd0-72eaf3814180.jpg|f8f0aada-c6b6-42e7-80bc-cb781590d56f.jpg|35c37796-87e9-48c3-917d-e23a51d21c83.jpg|', '3', '2017-04-16 22:42:49', '曝光', '2017-05-05 10:40:56', '5', '0', '象山区');
INSERT INTO `topic` VALUES ('403', '', '345235', '20', 'a03a691d-a7f8-4d40-b436-0de1b6a61ac2.mp4|f96ce2ca-ef7c-4d01-92cc-e750d042031d.jpg|', '0', '2017-04-16 22:44:00', '曝光', '2017-05-05 10:40:56', '0', '0', '象山区');
INSERT INTO `topic` VALUES ('404', '', '212123', '20', '4c41b3f5-0b2c-4567-ab0d-9f09ed4631e1.jpg|', '6', '2017-04-17 15:09:21', '曝光', '2017-05-05 10:40:56', '0', '0', '象山区');
INSERT INTO `topic` VALUES ('406', '', '4t5erftgsdfg', '20', '3aaff281-d680-4ab8-bd60-b14ad89030f8.mp4|b6f40e75-4084-4397-b11a-462aac0384af.jpg|32b988e8-9fd9-40a7-a3f4-171631598582.jpg|b01f6018-403a-4156-a9a5-cf7cc1a7eb71.jpg|e27a9021-6096-4c0e-b4c5-91e88c95350e.jpg|3d334443-a8b7-4a3d-b647-21d8e37814b4.jpg|', '7', '2017-04-17 21:09:43', '曝光', '2017-05-05 10:40:56', '0', '0', '象山区');
INSERT INTO `topic` VALUES ('423', '', '456456', '20', '6cdcbdbd-248b-4e8b-9755-b8ef7341d558.GIF|', '0', '2017-04-22 20:17:58', '曝光', '2017-05-05 10:40:56', '0', '0', '象山区');
INSERT INTO `topic` VALUES ('424', '', '啦啦', '20', '160736c6-dff2-43b5-b62e-7f1559d45851.png|', '0', '2017-04-22 20:20:47', '曝光', '2017-05-05 10:40:56', '0', '0', '象山区');
INSERT INTO `topic` VALUES ('425', '', 'test', '20', '57efff8e-211a-45f7-8d96-2ec094c791db.jpg|', '0', '2017-04-22 20:35:30', '曝光', '2017-05-05 10:40:56', '0', '0', '象山区');
INSERT INTO `topic` VALUES ('426', '', '大家好嘛 <br><img src=\"arclist/35.gif\"><img src=\"arclist/22.gif\">', '20', '', '0', '2017-04-22 21:13:10', '曝光', '2017-05-05 10:40:56', '0', '0', '象山区');
INSERT INTO `topic` VALUES ('427', '', '测试压缩', '20', '6ac63745-e893-4a2c-a43c-29e700a5b5c7.jpg|', '0', '2017-04-22 22:16:35', '曝光', '2017-05-05 10:40:56', '0', '0', '象山区');
INSERT INTO `topic` VALUES ('428', '', '测试压缩', '20', '1f3c87e2-d9ca-4d89-a745-fe1d107519a8.mp4|', '0', '2017-04-22 22:17:35', '曝光', '2017-05-05 10:40:56', '0', '0', '象山区');
INSERT INTO `topic` VALUES ('429', '', '测试压缩3', '20', '4d2c6544-5741-4cc8-9d67-1cf59ab2cb28.png|daf0a9dd-7f05-415f-9be8-f63980bd029a.jpg|d8e40011-9e23-433d-973e-4a10ffecf8b7.jpg|3417c4d4-99d4-4ccd-9f21-505ef490b102.jpg|eaaf14e3-96a7-44a3-86ef-b5089138da0b.GIF|', '0', '2017-04-22 22:18:08', '曝光', '2017-05-05 10:40:56', '0', '0', '象山区');
INSERT INTO `topic` VALUES ('430', '', '压缩', '20', '18c8ed9e-ebdb-442d-8977-ed79cb5c69d0.jpg|36098f5f-38ee-4fe9-bcd0-074859f9d5a5.jpg|22d7458a-3bec-4ef6-ab14-78953beae288.jpg|485d492a-1212-4fbd-804d-be63652ff5f9.jpg|58df19a2-7042-475d-9d5a-5e3f8b05154a.jpg|2bffab51-16d4-4627-b196-f34eed40586a.jpg|', '0', '2017-04-22 22:18:52', '曝光', '2017-05-05 10:40:56', '0', '0', '象山区');
INSERT INTO `topic` VALUES ('431', '', '21354', '20', 'ee52038c-02ce-4983-8e9a-e3315a7e75b3.GIF|', '0', '2017-04-22 22:23:26', '曝光', '2017-05-05 10:40:56', '0', '0', '象山区');
INSERT INTO `topic` VALUES ('432', '', '压缩', '20', 'eee703d4-bdcb-492f-bbef-cf133d5e8f77.jpg|', '0', '2017-04-22 22:42:13', '曝光', '2017-05-05 10:40:56', '0', '0', '象山区');
INSERT INTO `topic` VALUES ('433', '', '1111', '20', '2c240dbf-04b8-4ce7-8883-eec0425b9aa8.jpg|', '1', '2017-04-22 22:44:56', '曝光', '2017-05-05 10:40:56', '0', '0', '象山区');
INSERT INTO `topic` VALUES ('434', '', '032132', '20', '17ae0b0d-f02a-4b11-9ea1-0ae80f726841.jpg|', '0', '2017-04-22 22:45:51', '曝光', '2017-05-05 10:40:56', '0', '0', '象山区');
INSERT INTO `topic` VALUES ('437', '', '2132413213213213奔 f f f skdjflksg 电器城地地地地地霜在地夺枯霜夺枯需要在一枯三杰奎琳 硬顶否极泰来一一天天一', '20', '', '0', '2017-04-23 15:05:25', '曝光', '2017-05-05 10:40:56', '0', '0', '象山区');
INSERT INTO `topic` VALUES ('438', '', 'uuuu', '20', '93f6c96f-e173-4896-bc69-ce4a5233645a.mp4|', '0', '2017-04-23 22:44:08', '曝光', '2017-05-05 10:40:56', '1', '0', '象山区');
INSERT INTO `topic` VALUES ('439', '', '46', '20', '', '4', '2017-04-26 11:13:04', '闲聊', '2017-05-05 10:40:56', '6', '1', '象山区');
INSERT INTO `topic` VALUES ('453', '一条公告', '<p>sdfdf scfsdfsdf<br/></p>', '27', '', '0', '2017-04-29 13:31:56', '公告', '2017-05-05 10:40:56', '2', '0', '象山区');
INSERT INTO `topic` VALUES ('456', '花木成畦手自栽基朤45345345345345345', '<p>李厚霖夺<br/></p>', '27', '', '0', '2017-04-29 14:56:14', '公告', '2017-05-05 10:40:56', '13', '0', '象山区');
INSERT INTO `topic` VALUES ('457', '一很很长很长的测试公告一很很长很长的测试公告一很很长很长的测试公告一很很长很长的测试公告一很很长很长的测试公告一很很长很长的测试公告一很很长很长的测试公告一很很长很长的测试公告一很很长很长的测试公告一很很长很长的测试公告', '<p>一很很长很长的测试公告一很很长很长的测试公告一很很长很长的测试公告一很很长很长的测试公告一很很长很长的测试公告一很很长很长的测试公告一很很长很长的测试公告一很很<span style=\"background-color: rgb(221, 217, 195);\">长很长的测试公告一很很长</span>很长的测试公告<img src=\"http://img.baidu.com/hi/jx2/j_0024.gif\"/>、</p><ol><li>454563456</li><li>456456456</li><li>456312637485</li><li>4563</li><li>45645645<br/></li></ol>', '27', '', '0', '2017-05-01 09:58:04', '公告', '2017-05-07 13:22:33', '23', '1', '象山区');
INSERT INTO `topic` VALUES ('461', '411321321', '<p>121321<br/></p>', '27', '', '0', '2017-05-05 01:13:39', '公告', '2017-05-05 10:40:56', '5', '0', '象山区');
INSERT INTO `topic` VALUES ('462', '', '346536', '27', '', '0', '2017-05-05 10:11:33', '闯红灯', '2017-05-05 10:40:56', '1', '0', '象山区');
INSERT INTO `topic` VALUES ('463', '', '156315', '27', '', '0', '2017-05-05 10:12:31', '曝光', '2017-05-05 10:40:56', '0', '0', '象山区');
INSERT INTO `topic` VALUES ('464', '', '啦啦啦啦<br>', '20', '', '0', '2017-05-05 10:42:11', '扰乱公共秩序', '2017-05-05 10:42:11', '12', '0', '雁山区');
INSERT INTO `topic` VALUES ('465', '', '022', '27', '5bebc254-23ac-43d4-bf5c-52ac35e62d4f.jpg|', '0', '2017-05-05 16:23:04', '闯红灯', '2017-05-05 16:23:04', '0', '0', '七星区');
INSERT INTO `topic` VALUES ('466', '', '5246543<br>', '27', 'bdcd557d-18b7-4589-be72-f6511db0fb0d.png|', '0', '2017-05-05 16:25:30', '超速行驶', '2017-05-05 16:25:30', '1', '0', '其他');
INSERT INTO `topic` VALUES ('467', '', '12213213', '20', '8122637c-39da-4db8-809c-b93505b47120.jpg|', '0', '2017-05-05 23:12:01', '闯红灯', '2017-05-09 22:30:10', '7', '0', '七星区');
INSERT INTO `topic` VALUES ('468', '', '123123123', '27', '', '0', '2017-05-07 11:33:27', '吐槽', '2017-05-07 11:33:27', '8', '0', '叠彩区');
INSERT INTO `topic` VALUES ('469', '', 'skjdfl<br>', '27', '', '0', '2017-05-07 12:42:22', '扰乱公共秩序', '2017-05-07 12:42:22', '1', '0', '临桂区');
INSERT INTO `topic` VALUES ('470', '', 'sdf', '27', '', '0', '2017-05-07 14:22:52', '扰乱公共秩序', '2017-05-07 14:22:52', '0', '0', '其他');
INSERT INTO `topic` VALUES ('471', '', 'TYUTYU', '27', '', '0', '2017-05-07 15:08:38', '闯红灯', '2017-05-09 22:29:47', '5', '0', '七星区');
INSERT INTO `topic` VALUES ('473', '', '刚刚看到有人闯红灯，太不注意安全了！！！！！', '20', '', '0', '2017-05-12 21:17:32', '闯红灯', '2017-05-12 21:17:32', '0', '0', '临桂区');
INSERT INTO `topic` VALUES ('474', '', '别人把车停我家门口了，拜托不要总是乱停车行吗！！', '20', 'f2d752a0-40fc-4f69-85ec-a7187c01a2de.jpg|', '0', '2017-05-12 21:21:11', '乱停车', '2017-05-12 21:21:11', '5', '0', '七星区');
INSERT INTO `topic` VALUES ('475', '', '曝光视频<br>', '27', '409b429b-6516-49d1-a87b-48d9c03b69e1.mp4|', '1', '2017-05-13 15:01:33', '扰乱公共秩序', '2017-05-13 15:01:33', '30', '0', '其他');
INSERT INTO `topic` VALUES ('476', '', '违反了交通规则，居然和交警打起来了。。。。。。。。<img src=\"arclist/25.gif\"><img src=\"arclist/25.gif\">', '27', '7c1be65b-cba8-4a3a-b514-ee16826f14ed.mp4|', '6', '2017-05-23 22:32:48', '曝光', '2017-05-25 00:10:33', '10', '0', '其他');
INSERT INTO `topic` VALUES ('477', '', '看到了这个，因为不看火车的红灯，想闯以为不会发生什么事，结果让人。。。。。唉，珍惜生命啊大家！<br>', '20', '17a861f3-c779-41c0-9790-6de59c50345c.mp4|', '9', '2017-05-23 22:34:59', '曝光', '2017-05-25 00:10:59', '7', '0', '其他');
INSERT INTO `topic` VALUES ('478', '', '在十字街，一辆电车逆行，结果，出事了~~~~<br>', '20', '81208a48-d2bc-4c39-9a9b-70ab9f4a506e.mp4|', '19', '2017-05-23 22:37:38', '曝光', '2017-05-25 00:15:38', '27', '0', '其他');
INSERT INTO `topic` VALUES ('479', '', '国外对于行人过马路低头和闯红灯的一个警示，请珍重自己的生命！<br>', '20', '1f30d574-065b-482f-8e41-f62480dd26d7.mp4|', '9', '2017-05-23 22:51:48', '其他', '2017-05-25 00:10:17', '7', '0', '其他');
INSERT INTO `topic` VALUES ('480', '', '乱停车被别人用胶布贴满整辆车，真活该看他怎么开走！！！', '29', '8348f207-66c1-4508-abe2-d8fa5f350f4e.jpg|', '24', '2017-05-24 21:52:30', '乱停车', '2017-05-25 00:10:55', '7', '0', '秀峰区');
INSERT INTO `topic` VALUES ('481', '', '那么多学生闯红灯，父母还带着一起？真是不要命了<br>', '29', '2d1f5b7c-4494-47a3-b9ad-2a2ed5c093b7.jpg|', '17', '2017-05-24 21:55:09', '闯红灯', '2017-05-25 00:10:51', '9', '0', '七星区');
INSERT INTO `topic` VALUES ('482', '', '默默注视，完全没当红灯是一回事，应该也不当生命是一回事吧，。<br>', '29', 'db1c732e-fa66-451a-8bf7-29bcd0a2fc91.jpg|', '9', '2017-05-24 21:56:53', '闯红灯', '2017-05-25 00:10:46', '0', '0', '临桂区');
INSERT INTO `topic` VALUES ('483', '', '闯了红灯还那么开心，万一发生了意外还能笑成这样吗<br><img src=\"arclist/35.gif\"><img src=\"arclist/35.gif\">', '20', '3440c665-25ee-4d05-b09f-49525b68b734.jpg|', '15', '2017-05-24 21:57:57', '其他', '2017-05-25 00:10:38', '3', '0', '其他');
INSERT INTO `topic` VALUES ('484', '', '明明有个停止泊车标志放着了，还在乱停车。。。。。。<br>', '20', '6c40e368-92a7-4614-a1d1-e4acf5146095.jpg|', '8', '2017-05-24 21:58:53', '乱停车', '2017-05-25 00:10:42', '2', '0', '象山区');
INSERT INTO `topic` VALUES ('485', '', '看上去这红灯一点用都没有啊，大家看到没车就都走过去了！！<br>', '20', '440e34ce-8be2-4169-abfc-a3a43265d40f.jpg|', '9', '2017-05-24 21:59:40', '闯红灯', '2017-05-25 00:10:30', '4', '0', '叠彩区');
INSERT INTO `topic` VALUES ('489', '', '<a href=\'http://v.youku.com/v_show/id_XMjUwMDgyMTYwOA==.html?from=s1.8-1-1.2\' target= \"_blank\">http://v.youku.com/v_show/id_XMjUwMDgyMTYwOA==.html?from=s1.8-1-1.2</a>女子交通违规，大喊“非礼”<br>', '20', '', '4', '2017-05-24 22:22:53', '扰乱公共秩序', '2017-05-24 22:22:53', '4', '0', '其他');
INSERT INTO `topic` VALUES ('490', '', '把车乱停弄得好堵啊~~<br>', '20', 'bd5eb448-43b5-4e9c-80f2-8f1336792e61.jpg|903e3f05-db4a-46c3-92c2-cd86912d187e.jpg|', '5', '2017-05-24 22:27:04', '乱停车', '2017-05-25 00:10:26', '13', '0', '叠彩区');
INSERT INTO `topic` VALUES ('493', '', '你以路面没交警，就可以随便你的马儿奔？来看看监控抓拍的部分违章行为………遵守<em class=\"red\"></em>交通规则，关乎你我安全，马虎不得，侥幸不得。', '27', '2dbe9e1c-3065-4d45-8b4a-f58361812a10.jpg|097f449c-bbca-4f5f-a2ba-191da7c88f65.jpg|be782450-2caa-409c-b343-22583261ca3f.jpg|83ce55da-7f1c-479c-9752-590b45dbb608.jpg|ce4f7daa-e0ee-45ec-9fd1-f6c28febc0ff.jpg|cd2c6f18-6177-4668-aa8e-f5f8abb305b0.jpg|', '6', '2017-06-02 14:31:14', '吐槽', '2017-06-03 23:42:17', '16', '1', '叠彩区');
INSERT INTO `topic` VALUES ('494', '', '正常进主路，这货是不是作死。并排以后后座的姑娘骂道：你XX呀，你进主路该让我们直行车，响什么喇叭！！', '22', '4536046c-e28a-4220-9da1-ee10970c4876.mp4|', '5', '2017-06-02 16:03:51', '扰乱公共秩序', '2017-06-02 16:03:51', '0', '0', '七星区');
INSERT INTO `topic` VALUES ('495', '', '这个车开得。。。', '22', '03ff24b7-a921-44a8-9164-42dc80a242aa.gif|', '5', '2017-06-02 16:04:45', '扰乱公共秩序', '2017-06-02 16:04:45', '2', '0', '七星区');
INSERT INTO `topic` VALUES ('496', '', '大家素质越越好咯，礼让三分都不响喇叭。', '22', '83eea6e3-6d6c-4010-846f-dd70938bf003.mp4|', '6', '2017-06-02 16:05:47', '其他', '2017-06-02 16:07:24', '2', '0', '七星区');
INSERT INTO `topic` VALUES ('497', '', '可怕的交通动图，爱惜自己的生命要紧！！！！！！！！！', '22', '1eff975b-7f5f-411d-a762-807e1b6d7365.gif|58db25ec-3083-4699-a339-faac24491ee4.gif|eb1735f3-4327-435d-9c56-5a937e85d425.gif|10201bb4-e78a-4959-a7db-01145b2ccdcd.gif|40a1ba1f-efa2-4576-8b1b-9b189ca3561a.gif|', '4', '2017-06-02 16:10:46', '其他', '2017-06-02 16:10:46', '0', '0', '七星区');
INSERT INTO `topic` VALUES ('498', '', '【共享汽车违停，交警照锁没商量】广西日报记者王春楠报道：今日上午，两名大学生租用共享汽车时，因“想去附近吃粉”，在榕城路违法停车，结果被秀峰交警锁车，这也是桂林首辆违法的共享汽车。两人在参加小时安全教育后，租用的车辆才被解锁！交警提示，驾驶共享汽车一旦发生交通违法行为，法律责任由租用人承担。（吴平）', '22', '4ff704a3-0966-43dc-9e80-2aa431a7a6e1.jpg|', '9', '2017-06-02 16:13:45', '乱停车', '2017-06-15 13:18:21', '5', '0', '秀峰区');
INSERT INTO `topic` VALUES ('500', '', '【老司机你太烂水蜀黍在找你】人字拖、边用手机打牌边开车，罔顾车上乘客生命财产安全的恶劣行为！呼吁全城寻找该视频中的司机！\r\n						<img src=\"arclist/11.gif\">', '27', 'd2de026e-a153-4a57-847b-b1554812789c.mp4|', '5', '2017-06-02 16:19:22', '吐槽', '2017-06-02 20:09:52', '9', '1', '临桂区');
INSERT INTO `topic` VALUES ('507', '', '分享一个链接给大家。<a href=\'http://127.0.0.1:8080/gltraffic/login/detailtopic.action?topicid=478\' target= \"_blank\">http://127.0.0.1:8080/gltraffic/login/detailtopic.action?topicid=478</a>', '26', '', '0', '2017-06-03 01:07:17', '扰乱公共秩序', '2017-06-03 01:07:17', '2', '0', '秀峰区');
INSERT INTO `topic` VALUES ('508', '', '我要曝光一条内容', '27', 'b62a1c4a-2ea7-444e-9fee-1cd059e5668c.jpg|', '0', '2017-06-15 13:19:03', '扰乱公共秩序', '2017-06-15 13:19:03', '0', '0', '雁山区');
INSERT INTO `topic` VALUES ('509', '', '曝光一条内容', '27', 'b0b6b763-618b-424d-81a6-b70716f7a168.jpg|', '0', '2017-06-15 13:20:23', '扰乱公共秩序', '2017-06-15 13:20:42', '3', '0', '雁山区');

-- ----------------------------
-- Table structure for trafficlearn
-- ----------------------------
DROP TABLE IF EXISTS `trafficlearn`;
CREATE TABLE `trafficlearn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(15) DEFAULT NULL,
  `describe` varchar(150) DEFAULT NULL,
  `name` varchar(15) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  CONSTRAINT `trafficlearn_ibfk_1` FOREIGN KEY (`type`) REFERENCES `marktype` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of trafficlearn
-- ----------------------------
INSERT INTO `trafficlearn` VALUES ('1', '1.png', '除了基本形十字路口外，还有部分变异的十字路口，如：五路交叉路口、变形十字路口、变形五路交叉路口等。五路以上的路口均按十字路口对待。', '十字路口', '1');
INSERT INTO `trafficlearn` VALUES ('2', '2.png', '丁字形标志原则上设在与交叉口形状相符的道路上。右侧丁字路口，此标志设在进入T字路口以前的适当位置。', '禁止驶入', '1');
INSERT INTO `trafficlearn` VALUES ('3', '3.png', '丁字形标志原则上设在与交叉口形状相符的道路上。左侧丁字路口此标志设在进入丁字路口以前的适当位置。', 'T形交叉', '1');
INSERT INTO `trafficlearn` VALUES ('4', '4.png', '丁字形标志原则上设在与交叉口形状相符的道路上。此标志设在进入T字路口以前的适当位置。', 'T形交叉', '1');
INSERT INTO `trafficlearn` VALUES ('5', '5.png', '设在Y形路口以前的适当位置。', 'Y形交叉 ', '1');
INSERT INTO `trafficlearn` VALUES ('6', '6.png', '有的环形交叉路口，由于受线形限制或障碍物阻挡，此标志设在面对来车的路口的正面。', '环形交叉', '1');
INSERT INTO `trafficlearn` VALUES ('7', '7.png', '表示禁止一切车辆和行人通行。此标志设在禁止通行的道路入口处。', '禁止通行', '2');
INSERT INTO `trafficlearn` VALUES ('8', '8.png', '表示禁止车辆驶入。此标志设在禁止驶入的路段入口处。', '禁止驶入', '2');
INSERT INTO `trafficlearn` VALUES ('9', '9.png', '表示禁止某种机动车通行。此标志设在禁止机动车通行的路段入口处。', '除公共汽车外', '2');
INSERT INTO `trafficlearn` VALUES ('10', '10.png', '表示禁止载货机动车通行。此标志设在载货机动车通行的路段入口处。', '禁止机动车通行', '2');
INSERT INTO `trafficlearn` VALUES ('11', '11.png', '表示禁止三轮机动车通行。此标志设在禁止三轮机动车通行的路段入口处。', '禁止三轮机动车通行', '2');
INSERT INTO `trafficlearn` VALUES ('12', '12.png', '表示禁止大型客车通行。此标志设在禁止大型客车通行的路段入口处。', '禁止大型客车通行', '2');
INSERT INTO `trafficlearn` VALUES ('13', '13.png', '表示禁止小型客车通行。此标志设在禁止小型客车通行的路段入口处。', '禁止小型客车通行', '2');
INSERT INTO `trafficlearn` VALUES ('14', '14.png', '表示禁止汽车拖、挂车通行。此标志设在禁止汽车拖、挂车通行的路段入口处。', '禁止汽车拖、挂车通行', '2');
INSERT INTO `trafficlearn` VALUES ('15', '15.png', '表示禁止拖拉机通行。此标志设在禁止拖拉机通行的路段入口处。', '禁止拖拉机通行', '2');
INSERT INTO `trafficlearn` VALUES ('16', '16.png', '表示禁止农用运输车通行。此标志设在禁止农用运输车通行的路段入口处。', '禁止农用车通行', '2');
INSERT INTO `trafficlearn` VALUES ('17', '17.png', '表示只准一切车辆直行。此标志设在直行的路口以前适当位置。', '直行', '3');
INSERT INTO `trafficlearn` VALUES ('18', '18.png', '表示只准一切车辆向左转弯。此标志设在车辆必须向左转弯的路口以前适当位置。', '向左转弯', '3');
INSERT INTO `trafficlearn` VALUES ('19', '19.png', '表示只准一切车辆向右转弯。此标志设在车辆必须向右转弯的路口以前适当位置。', '向右转弯', '3');
INSERT INTO `trafficlearn` VALUES ('20', '20.png', '表示只准一切车辆直行和向左转弯。此标志设在车辆必须直行和向左转弯的路口以前适当位置。', '直行和向左转弯', '3');
INSERT INTO `trafficlearn` VALUES ('21', '21.png', '表示只准一切车辆直行和向右转弯。此标志设在车辆必须直行和向右转弯）的路口以前适当位置。', '直行和向右转弯', '3');
INSERT INTO `trafficlearn` VALUES ('22', '22.png', '表示只准一切车辆向左和向右转弯。此标志设在车辆必须向左和向右转弯的路口以前适当位置。', '直行和向右转弯', '3');
INSERT INTO `trafficlearn` VALUES ('23', '23.png', '表示只准一切车辆靠右侧道路行驶。此标志设在车辆必须靠右侧行驶的路口以前适当位置。', '靠右侧道路行驶', '3');
INSERT INTO `trafficlearn` VALUES ('24', '24.png', '表示只准一切车辆靠左侧）道路行驶。此标志设在车辆必须靠左侧行驶的路口以前适当位置。', '靠左侧道路行驶', '3');

-- ----------------------------
-- Table structure for t_base_pinyin
-- ----------------------------
DROP TABLE IF EXISTS `t_base_pinyin`;
CREATE TABLE `t_base_pinyin` (
  `pin_yin_` varchar(255) CHARACTER SET gbk NOT NULL,
  `code_` int(11) NOT NULL,
  PRIMARY KEY (`code_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of t_base_pinyin
-- ----------------------------
INSERT INTO `t_base_pinyin` VALUES ('zuo', '10254');
INSERT INTO `t_base_pinyin` VALUES ('zun', '10256');
INSERT INTO `t_base_pinyin` VALUES ('zui', '10260');
INSERT INTO `t_base_pinyin` VALUES ('zuan', '10262');
INSERT INTO `t_base_pinyin` VALUES ('zu', '10270');
INSERT INTO `t_base_pinyin` VALUES ('zou', '10274');
INSERT INTO `t_base_pinyin` VALUES ('zong', '10281');
INSERT INTO `t_base_pinyin` VALUES ('zi', '10296');
INSERT INTO `t_base_pinyin` VALUES ('zhuo', '10307');
INSERT INTO `t_base_pinyin` VALUES ('zhun', '10309');
INSERT INTO `t_base_pinyin` VALUES ('zhui', '10315');
INSERT INTO `t_base_pinyin` VALUES ('zhuang', '10322');
INSERT INTO `t_base_pinyin` VALUES ('zhuan', '10328');
INSERT INTO `t_base_pinyin` VALUES ('zhuai', '10329');
INSERT INTO `t_base_pinyin` VALUES ('zhua', '10331');
INSERT INTO `t_base_pinyin` VALUES ('zhu', '10519');
INSERT INTO `t_base_pinyin` VALUES ('zhou', '10533');
INSERT INTO `t_base_pinyin` VALUES ('zhong', '10544');
INSERT INTO `t_base_pinyin` VALUES ('zhi', '10587');
INSERT INTO `t_base_pinyin` VALUES ('zheng', '10764');
INSERT INTO `t_base_pinyin` VALUES ('zhen', '10780');
INSERT INTO `t_base_pinyin` VALUES ('zhe', '10790');
INSERT INTO `t_base_pinyin` VALUES ('zhao', '10800');
INSERT INTO `t_base_pinyin` VALUES ('zhang', '10815');
INSERT INTO `t_base_pinyin` VALUES ('zhan', '10832');
INSERT INTO `t_base_pinyin` VALUES ('zhai', '10838');
INSERT INTO `t_base_pinyin` VALUES ('zha', '11014');
INSERT INTO `t_base_pinyin` VALUES ('zeng', '11018');
INSERT INTO `t_base_pinyin` VALUES ('zen', '11019');
INSERT INTO `t_base_pinyin` VALUES ('zei', '11020');
INSERT INTO `t_base_pinyin` VALUES ('ze', '11024');
INSERT INTO `t_base_pinyin` VALUES ('zao', '11038');
INSERT INTO `t_base_pinyin` VALUES ('zang', '11041');
INSERT INTO `t_base_pinyin` VALUES ('zan', '11045');
INSERT INTO `t_base_pinyin` VALUES ('zai', '11052');
INSERT INTO `t_base_pinyin` VALUES ('za', '11055');
INSERT INTO `t_base_pinyin` VALUES ('yun', '11067');
INSERT INTO `t_base_pinyin` VALUES ('yue', '11077');
INSERT INTO `t_base_pinyin` VALUES ('yuan', '11097');
INSERT INTO `t_base_pinyin` VALUES ('yu', '11303');
INSERT INTO `t_base_pinyin` VALUES ('you', '11324');
INSERT INTO `t_base_pinyin` VALUES ('yong', '11339');
INSERT INTO `t_base_pinyin` VALUES ('yo', '11340');
INSERT INTO `t_base_pinyin` VALUES ('ying', '11358');
INSERT INTO `t_base_pinyin` VALUES ('yin', '11536');
INSERT INTO `t_base_pinyin` VALUES ('yi', '11589');
INSERT INTO `t_base_pinyin` VALUES ('ye', '11604');
INSERT INTO `t_base_pinyin` VALUES ('yao', '11781');
INSERT INTO `t_base_pinyin` VALUES ('yang', '11798');
INSERT INTO `t_base_pinyin` VALUES ('yan', '11831');
INSERT INTO `t_base_pinyin` VALUES ('ya', '11847');
INSERT INTO `t_base_pinyin` VALUES ('xun', '11861');
INSERT INTO `t_base_pinyin` VALUES ('xue', '11867');
INSERT INTO `t_base_pinyin` VALUES ('xuan', '12039');
INSERT INTO `t_base_pinyin` VALUES ('xu', '12058');
INSERT INTO `t_base_pinyin` VALUES ('xiu', '12067');
INSERT INTO `t_base_pinyin` VALUES ('xiong', '12074');
INSERT INTO `t_base_pinyin` VALUES ('xing', '12089');
INSERT INTO `t_base_pinyin` VALUES ('xin', '12099');
INSERT INTO `t_base_pinyin` VALUES ('xie', '12120');
INSERT INTO `t_base_pinyin` VALUES ('xiao', '12300');
INSERT INTO `t_base_pinyin` VALUES ('xiang', '12320');
INSERT INTO `t_base_pinyin` VALUES ('xian', '12346');
INSERT INTO `t_base_pinyin` VALUES ('xia', '12359');
INSERT INTO `t_base_pinyin` VALUES ('xi', '12556');
INSERT INTO `t_base_pinyin` VALUES ('wu', '12585');
INSERT INTO `t_base_pinyin` VALUES ('wo', '12594');
INSERT INTO `t_base_pinyin` VALUES ('weng', '12597');
INSERT INTO `t_base_pinyin` VALUES ('wen', '12607');
INSERT INTO `t_base_pinyin` VALUES ('wei', '12802');
INSERT INTO `t_base_pinyin` VALUES ('wang', '12812');
INSERT INTO `t_base_pinyin` VALUES ('wan', '12829');
INSERT INTO `t_base_pinyin` VALUES ('wai', '12831');
INSERT INTO `t_base_pinyin` VALUES ('wa', '12838');
INSERT INTO `t_base_pinyin` VALUES ('tuo', '12849');
INSERT INTO `t_base_pinyin` VALUES ('tun', '12852');
INSERT INTO `t_base_pinyin` VALUES ('tui', '12858');
INSERT INTO `t_base_pinyin` VALUES ('tuan', '12860');
INSERT INTO `t_base_pinyin` VALUES ('tu', '12871');
INSERT INTO `t_base_pinyin` VALUES ('tou', '12875');
INSERT INTO `t_base_pinyin` VALUES ('tong', '12888');
INSERT INTO `t_base_pinyin` VALUES ('ting', '13060');
INSERT INTO `t_base_pinyin` VALUES ('tie', '13063');
INSERT INTO `t_base_pinyin` VALUES ('tiao', '13068');
INSERT INTO `t_base_pinyin` VALUES ('tian', '13076');
INSERT INTO `t_base_pinyin` VALUES ('ti', '13091');
INSERT INTO `t_base_pinyin` VALUES ('teng', '13095');
INSERT INTO `t_base_pinyin` VALUES ('te', '13096');
INSERT INTO `t_base_pinyin` VALUES ('tao', '13107');
INSERT INTO `t_base_pinyin` VALUES ('tang', '13120');
INSERT INTO `t_base_pinyin` VALUES ('tan', '13138');
INSERT INTO `t_base_pinyin` VALUES ('tai', '13147');
INSERT INTO `t_base_pinyin` VALUES ('ta', '13318');
INSERT INTO `t_base_pinyin` VALUES ('suo', '13326');
INSERT INTO `t_base_pinyin` VALUES ('sun', '13329');
INSERT INTO `t_base_pinyin` VALUES ('sui', '13340');
INSERT INTO `t_base_pinyin` VALUES ('suan', '13343');
INSERT INTO `t_base_pinyin` VALUES ('su', '13356');
INSERT INTO `t_base_pinyin` VALUES ('sou', '13359');
INSERT INTO `t_base_pinyin` VALUES ('song', '13367');
INSERT INTO `t_base_pinyin` VALUES ('si', '13383');
INSERT INTO `t_base_pinyin` VALUES ('shuo', '13387');
INSERT INTO `t_base_pinyin` VALUES ('shun', '13391');
INSERT INTO `t_base_pinyin` VALUES ('shui', '13395');
INSERT INTO `t_base_pinyin` VALUES ('shuang', '13398');
INSERT INTO `t_base_pinyin` VALUES ('shuan', '13400');
INSERT INTO `t_base_pinyin` VALUES ('shuai', '13404');
INSERT INTO `t_base_pinyin` VALUES ('shua', '13406');
INSERT INTO `t_base_pinyin` VALUES ('shu', '13601');
INSERT INTO `t_base_pinyin` VALUES ('shou', '13611');
INSERT INTO `t_base_pinyin` VALUES ('shi', '13658');
INSERT INTO `t_base_pinyin` VALUES ('sheng', '13831');
INSERT INTO `t_base_pinyin` VALUES ('shen', '13847');
INSERT INTO `t_base_pinyin` VALUES ('she', '13859');
INSERT INTO `t_base_pinyin` VALUES ('shao', '13870');
INSERT INTO `t_base_pinyin` VALUES ('shang', '13878');
INSERT INTO `t_base_pinyin` VALUES ('shan', '13894');
INSERT INTO `t_base_pinyin` VALUES ('shai', '13896');
INSERT INTO `t_base_pinyin` VALUES ('sha', '13905');
INSERT INTO `t_base_pinyin` VALUES ('seng', '13906');
INSERT INTO `t_base_pinyin` VALUES ('sen', '13907');
INSERT INTO `t_base_pinyin` VALUES ('se', '13910');
INSERT INTO `t_base_pinyin` VALUES ('sao', '13914');
INSERT INTO `t_base_pinyin` VALUES ('sang', '13917');
INSERT INTO `t_base_pinyin` VALUES ('san', '14083');
INSERT INTO `t_base_pinyin` VALUES ('sai', '14087');
INSERT INTO `t_base_pinyin` VALUES ('sa', '14090');
INSERT INTO `t_base_pinyin` VALUES ('ruo', '14092');
INSERT INTO `t_base_pinyin` VALUES ('run', '14094');
INSERT INTO `t_base_pinyin` VALUES ('rui', '14097');
INSERT INTO `t_base_pinyin` VALUES ('ruan', '14099');
INSERT INTO `t_base_pinyin` VALUES ('ru', '14109');
INSERT INTO `t_base_pinyin` VALUES ('rou', '14112');
INSERT INTO `t_base_pinyin` VALUES ('rong', '14122');
INSERT INTO `t_base_pinyin` VALUES ('ri', '14123');
INSERT INTO `t_base_pinyin` VALUES ('reng', '14125');
INSERT INTO `t_base_pinyin` VALUES ('ren', '14135');
INSERT INTO `t_base_pinyin` VALUES ('re', '14137');
INSERT INTO `t_base_pinyin` VALUES ('rao', '14140');
INSERT INTO `t_base_pinyin` VALUES ('rang', '14145');
INSERT INTO `t_base_pinyin` VALUES ('ran', '14149');
INSERT INTO `t_base_pinyin` VALUES ('qun', '14151');
INSERT INTO `t_base_pinyin` VALUES ('que', '14159');
INSERT INTO `t_base_pinyin` VALUES ('quan', '14170');
INSERT INTO `t_base_pinyin` VALUES ('qu', '14345');
INSERT INTO `t_base_pinyin` VALUES ('qiu', '14353');
INSERT INTO `t_base_pinyin` VALUES ('qiong', '14355');
INSERT INTO `t_base_pinyin` VALUES ('qing', '14368');
INSERT INTO `t_base_pinyin` VALUES ('qin', '14379');
INSERT INTO `t_base_pinyin` VALUES ('qie', '14384');
INSERT INTO `t_base_pinyin` VALUES ('qiao', '14399');
INSERT INTO `t_base_pinyin` VALUES ('qiang', '14407');
INSERT INTO `t_base_pinyin` VALUES ('qian', '14429');
INSERT INTO `t_base_pinyin` VALUES ('qia', '14594');
INSERT INTO `t_base_pinyin` VALUES ('qi', '14630');
INSERT INTO `t_base_pinyin` VALUES ('pu', '14645');
INSERT INTO `t_base_pinyin` VALUES ('po', '14654');
INSERT INTO `t_base_pinyin` VALUES ('ping', '14663');
INSERT INTO `t_base_pinyin` VALUES ('pin', '14668');
INSERT INTO `t_base_pinyin` VALUES ('pie', '14670');
INSERT INTO `t_base_pinyin` VALUES ('piao', '14674');
INSERT INTO `t_base_pinyin` VALUES ('pian', '14678');
INSERT INTO `t_base_pinyin` VALUES ('pi', '14857');
INSERT INTO `t_base_pinyin` VALUES ('peng', '14871');
INSERT INTO `t_base_pinyin` VALUES ('pen', '14873');
INSERT INTO `t_base_pinyin` VALUES ('pei', '14882');
INSERT INTO `t_base_pinyin` VALUES ('pao', '14889');
INSERT INTO `t_base_pinyin` VALUES ('pang', '14894');
INSERT INTO `t_base_pinyin` VALUES ('pan', '14902');
INSERT INTO `t_base_pinyin` VALUES ('pai', '14908');
INSERT INTO `t_base_pinyin` VALUES ('pa', '14914');
INSERT INTO `t_base_pinyin` VALUES ('ou', '14921');
INSERT INTO `t_base_pinyin` VALUES ('o', '14922');
INSERT INTO `t_base_pinyin` VALUES ('nuo', '14926');
INSERT INTO `t_base_pinyin` VALUES ('nue', '14928');
INSERT INTO `t_base_pinyin` VALUES ('nuan', '14929');
INSERT INTO `t_base_pinyin` VALUES ('nv', '14930');
INSERT INTO `t_base_pinyin` VALUES ('nu', '14933');
INSERT INTO `t_base_pinyin` VALUES ('nong', '14937');
INSERT INTO `t_base_pinyin` VALUES ('niu', '14941');
INSERT INTO `t_base_pinyin` VALUES ('ning', '15109');
INSERT INTO `t_base_pinyin` VALUES ('nin', '15110');
INSERT INTO `t_base_pinyin` VALUES ('nie', '15117');
INSERT INTO `t_base_pinyin` VALUES ('niao', '15119');
INSERT INTO `t_base_pinyin` VALUES ('niang', '15121');
INSERT INTO `t_base_pinyin` VALUES ('nian', '15128');
INSERT INTO `t_base_pinyin` VALUES ('ni', '15139');
INSERT INTO `t_base_pinyin` VALUES ('neng', '15140');
INSERT INTO `t_base_pinyin` VALUES ('nen', '15141');
INSERT INTO `t_base_pinyin` VALUES ('nei', '15143');
INSERT INTO `t_base_pinyin` VALUES ('ne', '15144');
INSERT INTO `t_base_pinyin` VALUES ('nao', '15149');
INSERT INTO `t_base_pinyin` VALUES ('nang', '15150');
INSERT INTO `t_base_pinyin` VALUES ('nan', '15153');
INSERT INTO `t_base_pinyin` VALUES ('nai', '15158');
INSERT INTO `t_base_pinyin` VALUES ('na', '15165');
INSERT INTO `t_base_pinyin` VALUES ('mu', '15180');
INSERT INTO `t_base_pinyin` VALUES ('mou', '15183');
INSERT INTO `t_base_pinyin` VALUES ('mo', '15362');
INSERT INTO `t_base_pinyin` VALUES ('miu', '15363');
INSERT INTO `t_base_pinyin` VALUES ('ming', '15369');
INSERT INTO `t_base_pinyin` VALUES ('min', '15375');
INSERT INTO `t_base_pinyin` VALUES ('mie', '15377');
INSERT INTO `t_base_pinyin` VALUES ('miao', '15385');
INSERT INTO `t_base_pinyin` VALUES ('mian', '15394');
INSERT INTO `t_base_pinyin` VALUES ('mi', '15408');
INSERT INTO `t_base_pinyin` VALUES ('meng', '15416');
INSERT INTO `t_base_pinyin` VALUES ('men', '15419');
INSERT INTO `t_base_pinyin` VALUES ('mei', '15435');
INSERT INTO `t_base_pinyin` VALUES ('me', '15436');
INSERT INTO `t_base_pinyin` VALUES ('mao', '15448');
INSERT INTO `t_base_pinyin` VALUES ('mang', '15454');
INSERT INTO `t_base_pinyin` VALUES ('man', '15625');
INSERT INTO `t_base_pinyin` VALUES ('mai', '15631');
INSERT INTO `t_base_pinyin` VALUES ('ma', '15640');
INSERT INTO `t_base_pinyin` VALUES ('luo', '15652');
INSERT INTO `t_base_pinyin` VALUES ('lun', '15659');
INSERT INTO `t_base_pinyin` VALUES ('lue', '15661');
INSERT INTO `t_base_pinyin` VALUES ('luan', '15667');
INSERT INTO `t_base_pinyin` VALUES ('lv', '15681');
INSERT INTO `t_base_pinyin` VALUES ('lu', '15701');
INSERT INTO `t_base_pinyin` VALUES ('lou', '15707');
INSERT INTO `t_base_pinyin` VALUES ('long', '15878');
INSERT INTO `t_base_pinyin` VALUES ('liu', '15889');
INSERT INTO `t_base_pinyin` VALUES ('ling', '15903');
INSERT INTO `t_base_pinyin` VALUES ('lin', '15915');
INSERT INTO `t_base_pinyin` VALUES ('lie', '15920');
INSERT INTO `t_base_pinyin` VALUES ('liao', '15933');
INSERT INTO `t_base_pinyin` VALUES ('liang', '15944');
INSERT INTO `t_base_pinyin` VALUES ('lian', '15958');
INSERT INTO `t_base_pinyin` VALUES ('lia', '15959');
INSERT INTO `t_base_pinyin` VALUES ('li', '16155');
INSERT INTO `t_base_pinyin` VALUES ('leng', '16158');
INSERT INTO `t_base_pinyin` VALUES ('lei', '16169');
INSERT INTO `t_base_pinyin` VALUES ('le', '16171');
INSERT INTO `t_base_pinyin` VALUES ('lao', '16180');
INSERT INTO `t_base_pinyin` VALUES ('lang', '16187');
INSERT INTO `t_base_pinyin` VALUES ('lan', '16202');
INSERT INTO `t_base_pinyin` VALUES ('lai', '16205');
INSERT INTO `t_base_pinyin` VALUES ('la', '16212');
INSERT INTO `t_base_pinyin` VALUES ('kuo', '16216');
INSERT INTO `t_base_pinyin` VALUES ('kun', '16220');
INSERT INTO `t_base_pinyin` VALUES ('kui', '16393');
INSERT INTO `t_base_pinyin` VALUES ('kuang', '16401');
INSERT INTO `t_base_pinyin` VALUES ('kuan', '16403');
INSERT INTO `t_base_pinyin` VALUES ('kuai', '16407');
INSERT INTO `t_base_pinyin` VALUES ('kua', '16412');
INSERT INTO `t_base_pinyin` VALUES ('ku', '16419');
INSERT INTO `t_base_pinyin` VALUES ('kou', '16423');
INSERT INTO `t_base_pinyin` VALUES ('kong', '16427');
INSERT INTO `t_base_pinyin` VALUES ('keng', '16429');
INSERT INTO `t_base_pinyin` VALUES ('ken', '16433');
INSERT INTO `t_base_pinyin` VALUES ('ke', '16448');
INSERT INTO `t_base_pinyin` VALUES ('kao', '16452');
INSERT INTO `t_base_pinyin` VALUES ('kang', '16459');
INSERT INTO `t_base_pinyin` VALUES ('kan', '16465');
INSERT INTO `t_base_pinyin` VALUES ('kai', '16470');
INSERT INTO `t_base_pinyin` VALUES ('ka', '16474');
INSERT INTO `t_base_pinyin` VALUES ('jun', '16647');
INSERT INTO `t_base_pinyin` VALUES ('jue', '16657');
INSERT INTO `t_base_pinyin` VALUES ('juan', '16664');
INSERT INTO `t_base_pinyin` VALUES ('ju', '16689');
INSERT INTO `t_base_pinyin` VALUES ('jiu', '16706');
INSERT INTO `t_base_pinyin` VALUES ('jiong', '16708');
INSERT INTO `t_base_pinyin` VALUES ('jing', '16733');
INSERT INTO `t_base_pinyin` VALUES ('jin', '16915');
INSERT INTO `t_base_pinyin` VALUES ('jie', '16942');
INSERT INTO `t_base_pinyin` VALUES ('jiao', '16970');
INSERT INTO `t_base_pinyin` VALUES ('jiang', '16983');
INSERT INTO `t_base_pinyin` VALUES ('jian', '17185');
INSERT INTO `t_base_pinyin` VALUES ('jia', '17202');
INSERT INTO `t_base_pinyin` VALUES ('ji', '17417');
INSERT INTO `t_base_pinyin` VALUES ('huo', '17427');
INSERT INTO `t_base_pinyin` VALUES ('hun', '17433');
INSERT INTO `t_base_pinyin` VALUES ('hui', '17454');
INSERT INTO `t_base_pinyin` VALUES ('huang', '17468');
INSERT INTO `t_base_pinyin` VALUES ('huan', '17482');
INSERT INTO `t_base_pinyin` VALUES ('huai', '17487');
INSERT INTO `t_base_pinyin` VALUES ('hua', '17496');
INSERT INTO `t_base_pinyin` VALUES ('hu', '17676');
INSERT INTO `t_base_pinyin` VALUES ('hou', '17683');
INSERT INTO `t_base_pinyin` VALUES ('hong', '17692');
INSERT INTO `t_base_pinyin` VALUES ('heng', '17697');
INSERT INTO `t_base_pinyin` VALUES ('hen', '17701');
INSERT INTO `t_base_pinyin` VALUES ('hei', '17703');
INSERT INTO `t_base_pinyin` VALUES ('he', '17721');
INSERT INTO `t_base_pinyin` VALUES ('hao', '17730');
INSERT INTO `t_base_pinyin` VALUES ('hang', '17733');
INSERT INTO `t_base_pinyin` VALUES ('han', '17752');
INSERT INTO `t_base_pinyin` VALUES ('hai', '17759');
INSERT INTO `t_base_pinyin` VALUES ('ha', '17922');
INSERT INTO `t_base_pinyin` VALUES ('guo', '17928');
INSERT INTO `t_base_pinyin` VALUES ('gun', '17931');
INSERT INTO `t_base_pinyin` VALUES ('gui', '17947');
INSERT INTO `t_base_pinyin` VALUES ('guang', '17950');
INSERT INTO `t_base_pinyin` VALUES ('guan', '17961');
INSERT INTO `t_base_pinyin` VALUES ('guai', '17964');
INSERT INTO `t_base_pinyin` VALUES ('gua', '17970');
INSERT INTO `t_base_pinyin` VALUES ('gu', '17988');
INSERT INTO `t_base_pinyin` VALUES ('gou', '17997');
INSERT INTO `t_base_pinyin` VALUES ('gong', '18012');
INSERT INTO `t_base_pinyin` VALUES ('geng', '18181');
INSERT INTO `t_base_pinyin` VALUES ('gen', '18183');
INSERT INTO `t_base_pinyin` VALUES ('gei', '18184');
INSERT INTO `t_base_pinyin` VALUES ('ge', '18201');
INSERT INTO `t_base_pinyin` VALUES ('gao', '18211');
INSERT INTO `t_base_pinyin` VALUES ('gang', '18220');
INSERT INTO `t_base_pinyin` VALUES ('gan', '18231');
INSERT INTO `t_base_pinyin` VALUES ('gai', '18237');
INSERT INTO `t_base_pinyin` VALUES ('ga', '18239');
INSERT INTO `t_base_pinyin` VALUES ('fu', '18446');
INSERT INTO `t_base_pinyin` VALUES ('fou', '18447');
INSERT INTO `t_base_pinyin` VALUES ('fo', '18448');
INSERT INTO `t_base_pinyin` VALUES ('feng', '18463');
INSERT INTO `t_base_pinyin` VALUES ('fen', '18478');
INSERT INTO `t_base_pinyin` VALUES ('fei', '18490');
INSERT INTO `t_base_pinyin` VALUES ('fang', '18501');
INSERT INTO `t_base_pinyin` VALUES ('fan', '18518');
INSERT INTO `t_base_pinyin` VALUES ('fa', '18526');
INSERT INTO `t_base_pinyin` VALUES ('er', '18696');
INSERT INTO `t_base_pinyin` VALUES ('en', '18697');
INSERT INTO `t_base_pinyin` VALUES ('e', '18710');
INSERT INTO `t_base_pinyin` VALUES ('duo', '18722');
INSERT INTO `t_base_pinyin` VALUES ('dun', '18731');
INSERT INTO `t_base_pinyin` VALUES ('dui', '18735');
INSERT INTO `t_base_pinyin` VALUES ('duan', '18741');
INSERT INTO `t_base_pinyin` VALUES ('du', '18756');
INSERT INTO `t_base_pinyin` VALUES ('dou', '18763');
INSERT INTO `t_base_pinyin` VALUES ('dong', '18773');
INSERT INTO `t_base_pinyin` VALUES ('diu', '18774');
INSERT INTO `t_base_pinyin` VALUES ('ding', '18783');
INSERT INTO `t_base_pinyin` VALUES ('die', '18952');
INSERT INTO `t_base_pinyin` VALUES ('diao', '18961');
INSERT INTO `t_base_pinyin` VALUES ('dian', '18977');
INSERT INTO `t_base_pinyin` VALUES ('di', '18996');
INSERT INTO `t_base_pinyin` VALUES ('deng', '19003');
INSERT INTO `t_base_pinyin` VALUES ('de', '19006');
INSERT INTO `t_base_pinyin` VALUES ('dao', '19018');
INSERT INTO `t_base_pinyin` VALUES ('dang', '19023');
INSERT INTO `t_base_pinyin` VALUES ('dan', '19038');
INSERT INTO `t_base_pinyin` VALUES ('dai', '19212');
INSERT INTO `t_base_pinyin` VALUES ('da', '19218');
INSERT INTO `t_base_pinyin` VALUES ('cuo', '19224');
INSERT INTO `t_base_pinyin` VALUES ('cun', '19227');
INSERT INTO `t_base_pinyin` VALUES ('cui', '19235');
INSERT INTO `t_base_pinyin` VALUES ('cuan', '19238');
INSERT INTO `t_base_pinyin` VALUES ('cu', '19242');
INSERT INTO `t_base_pinyin` VALUES ('cou', '19243');
INSERT INTO `t_base_pinyin` VALUES ('cong', '19249');
INSERT INTO `t_base_pinyin` VALUES ('ci', '19261');
INSERT INTO `t_base_pinyin` VALUES ('chuo', '19263');
INSERT INTO `t_base_pinyin` VALUES ('chun', '19270');
INSERT INTO `t_base_pinyin` VALUES ('chui', '19275');
INSERT INTO `t_base_pinyin` VALUES ('chuang', '19281');
INSERT INTO `t_base_pinyin` VALUES ('chuan', '19288');
INSERT INTO `t_base_pinyin` VALUES ('chuai', '19289');
INSERT INTO `t_base_pinyin` VALUES ('chu', '19467');
INSERT INTO `t_base_pinyin` VALUES ('chou', '19479');
INSERT INTO `t_base_pinyin` VALUES ('chong', '19484');
INSERT INTO `t_base_pinyin` VALUES ('chi', '19500');
INSERT INTO `t_base_pinyin` VALUES ('cheng', '19515');
INSERT INTO `t_base_pinyin` VALUES ('chen', '19525');
INSERT INTO `t_base_pinyin` VALUES ('che', '19531');
INSERT INTO `t_base_pinyin` VALUES ('chao', '19540');
INSERT INTO `t_base_pinyin` VALUES ('chang', '19715');
INSERT INTO `t_base_pinyin` VALUES ('chan', '19725');
INSERT INTO `t_base_pinyin` VALUES ('chai', '19728');
INSERT INTO `t_base_pinyin` VALUES ('cha', '19739');
INSERT INTO `t_base_pinyin` VALUES ('ceng', '19741');
INSERT INTO `t_base_pinyin` VALUES ('ce', '19746');
INSERT INTO `t_base_pinyin` VALUES ('cao', '19751');
INSERT INTO `t_base_pinyin` VALUES ('cang', '19756');
INSERT INTO `t_base_pinyin` VALUES ('can', '19763');
INSERT INTO `t_base_pinyin` VALUES ('cai', '19774');
INSERT INTO `t_base_pinyin` VALUES ('ca', '19775');
INSERT INTO `t_base_pinyin` VALUES ('bu', '19784');
INSERT INTO `t_base_pinyin` VALUES ('bo', '19805');
INSERT INTO `t_base_pinyin` VALUES ('bing', '19976');
INSERT INTO `t_base_pinyin` VALUES ('bin', '19982');
INSERT INTO `t_base_pinyin` VALUES ('bie', '19986');
INSERT INTO `t_base_pinyin` VALUES ('biao', '19990');
INSERT INTO `t_base_pinyin` VALUES ('bian', '20002');
INSERT INTO `t_base_pinyin` VALUES ('bi', '20026');
INSERT INTO `t_base_pinyin` VALUES ('beng', '20032');
INSERT INTO `t_base_pinyin` VALUES ('ben', '20036');
INSERT INTO `t_base_pinyin` VALUES ('bei', '20051');
INSERT INTO `t_base_pinyin` VALUES ('bao', '20230');
INSERT INTO `t_base_pinyin` VALUES ('bang', '20242');
INSERT INTO `t_base_pinyin` VALUES ('ban', '20257');
INSERT INTO `t_base_pinyin` VALUES ('bai', '20265');
INSERT INTO `t_base_pinyin` VALUES ('ba', '20283');
INSERT INTO `t_base_pinyin` VALUES ('ao', '20292');
INSERT INTO `t_base_pinyin` VALUES ('ang', '20295');
INSERT INTO `t_base_pinyin` VALUES ('an', '20304');
INSERT INTO `t_base_pinyin` VALUES ('ai', '20317');
INSERT INTO `t_base_pinyin` VALUES ('a', '20319');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` char(16) DEFAULT NULL,
  `user_name` char(16) DEFAULT NULL,
  `user_headimg` varchar(300) DEFAULT NULL,
  `user_password` char(16) DEFAULT NULL,
  `user_indentity` varchar(10) DEFAULT NULL,
  `user_sex` varchar(2) DEFAULT NULL,
  `user_registertime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_last_logintime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_state` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('20', 'hemincan', '何小灿', null, '123123', '普通用户', '1', '2017-02-19 14:51:59', '2017-05-19 15:02:14', '0');
INSERT INTO `user` VALUES ('22', 'hemincan2', '我是可爱的小宝宝', null, '123123', '普通用户', '2', '2017-05-19 14:52:03', '2017-05-19 14:52:03', '0');
INSERT INTO `user` VALUES ('23', 'cancan', 'kb哇晒顶替', null, '123123', '普通用户', '1', '2017-05-19 14:52:01', '2017-05-19 14:52:01', '0');
INSERT INTO `user` VALUES ('24', 'hemincan3', '我是枯叶', null, '123123', '普通用户', '2', '2017-05-19 14:52:04', '2017-05-19 14:52:04', '0');
INSERT INTO `user` VALUES ('25', 'hemincan4', 'afdsf', null, '123123', '普通用户', '1', '2017-05-19 14:52:06', '2017-05-19 14:52:06', '0');
INSERT INTO `user` VALUES ('26', 'test', '111222', null, '123123', '普通用户', '1', '2017-05-19 14:52:07', '2017-05-19 14:52:07', '0');
INSERT INTO `user` VALUES ('27', 'admin', '管理员', null, '123123', '管理员', '1', '2017-05-19 14:52:11', '2017-05-19 14:52:11', '0');
INSERT INTO `user` VALUES ('28', '3423234', '3333', null, '123123', '普通用户', '1', '2017-05-19 15:09:51', '2017-05-19 15:09:51', '0');
INSERT INTO `user` VALUES ('29', 'hemincan5', '我要狠狠的曝光', null, '123123', '普通用户', '1', '2017-05-24 21:52:06', '2017-05-24 21:52:06', '0');
INSERT INTO `user` VALUES ('30', 'test1', '李小姐', null, '123123', '普通用户', '2', '2017-05-24 23:36:39', '2017-05-24 23:36:39', '0');
INSERT INTO `user` VALUES ('31', 'test2', '何先生', null, '123123', '普通用户', '1', '2017-05-24 23:47:43', '2017-05-24 23:47:43', '0');

-- ----------------------------
-- View structure for comment_view
-- ----------------------------
DROP VIEW IF EXISTS `comment_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`hemincan`@`%` SQL SECURITY DEFINER VIEW `comment_view` AS select `comment`.`id` AS `id`,`comment`.`comment_topic_id` AS `comment_topic_id`,`comment`.`comment_from_id` AS `comment_from_id`,`comment`.`comment_content` AS `comment_content`,`comment`.`comment_time` AS `comment_time`,count(`reply`.`id`) AS `reply_count` from (`comment` left join `reply` on((`comment`.`id` = `reply`.`reply_comment_id`))) group by `comment`.`id` ;

-- ----------------------------
-- Function structure for to_pinyin
-- ----------------------------
DROP FUNCTION IF EXISTS `to_pinyin`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `to_pinyin`(NAME VARCHAR(255) CHARSET gbk) RETURNS varchar(255) CHARSET gbk
BEGIN
    DECLARE mycode INT;
    DECLARE tmp_lcode VARCHAR(2) CHARSET gbk;
    DECLARE lcode INT;

    DECLARE tmp_rcode VARCHAR(2) CHARSET gbk;
    DECLARE rcode INT;

    DECLARE mypy VARCHAR(255) CHARSET gbk DEFAULT '';
    DECLARE lp INT;

    SET mycode = 0;
    SET lp = 1;

    SET NAME = HEX(NAME);

    WHILE lp < LENGTH(NAME) DO

        SET tmp_lcode = SUBSTRING(NAME, lp, 2);
        SET lcode = CAST(ASCII(UNHEX(tmp_lcode)) AS UNSIGNED);
        SET tmp_rcode = SUBSTRING(NAME, lp + 2, 2);
        SET rcode = CAST(ASCII(UNHEX(tmp_rcode)) AS UNSIGNED);
        IF lcode > 128 THEN
            SET mycode =65536 - lcode * 256 - rcode ;
            SELECT CONCAT(mypy,pin_yin_) INTO mypy FROM t_base_pinyin WHERE CODE_ >= ABS(mycode) ORDER BY CODE_ ASC LIMIT 1;
            SET lp = lp + 4;
        ELSE
            SET mypy = CONCAT(mypy,CHAR(CAST(ASCII(UNHEX(SUBSTRING(NAME, lp, 2))) AS UNSIGNED)));
            SET lp = lp + 2;
        END IF;
    END WHILE;
    RETURN LOWER(mypy);
END
;;
DELIMITER ;

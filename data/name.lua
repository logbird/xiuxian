local globalName = {
    xing = {
        "赵","钱","孙","李","周","吴","郑","王","冯","陈","褚","卫","蒋","沈","韩","杨","朱","秦","尤","许","何","吕","施","张",
        "孔","曹","严","华","金","魏","陶","姜","戚","谢","邹","喻","柏","水","窦","章","云","苏","潘","葛","奚","范","彭","郎",
        "鲁","韦","昌","马","苗","凤","花","方","俞","任","袁","柳","酆","鲍","史","唐","费","廉","岑","薛","雷","贺","倪","汤",
        "滕","殷","罗","毕","郝","邬","安","常","乐","于","时","傅","皮","卞","齐","康","伍","余","元","卜","顾","孟","平","黄",
        "和","穆","萧","尹","姚","邵","湛","汪","祁","毛","禹","狄","米","贝","明","臧","计","伏","成","戴","谈","宋","茅","庞",
        "熊","纪","舒","屈","项","祝","董","梁","杜","阮","蓝","闵","席","季","麻","强","贾","路","娄","危","江","童","颜","郭",
        "梅","盛","林","刁","钟","徐","邱","骆","高","夏","蔡","田","樊","胡","凌","霍","虞","万","支","柯","昝","管","卢","莫",
        "房","裘","缪","干","解","应","宗","丁","宣","贲","邓","郁","单","杭","洪","包","诸","左","石","崔","吉","钮","龚","程",
        "嵇","邢","滑","裴","陆","荣","翁","荀","羊","惠","甄","曲","家","封","芮","羿","储","靳","汲","邴","糜","松","井","段",
        "富","巫","乌","焦","巴","弓","牧","隗","山","谷","车","侯","宓","蓬","全","郗","班","仰","秋","仲","伊","宫","宁","仇",
        "栾","暴","甘","钭","历","戎","祖","武","符","刘","景","詹","束","龙","叶","幸","司","韶","郜","黎","蓟","溥","印","宿",
        "白","怀","蒲","邰","从","鄂","索","咸","籍","赖","卓","蔺","屠","蒙","池","乔","阳","胥","能","苍","双","闻","莘","党",
        "翟","谭","贡","劳","逄","姬","申","扶","堵","冉","宰","郦","雍","却","璩","桑","桂","濮","牛","寿","通","边","扈","燕",
        "冀","浦","尚","农","温","别","庄","晏","柴","瞿","阎","充","慕","连","茹","习","宦","艾","鱼","容","向","古","易","慎",
        "戈","廖","庾","终","暨","居","衡","步","都","耿","满","弘","匡","国","文","寇","广","禄","阙","东","欧","殳","沃","利",
        "蔚","越","夔","隆","师","巩","厍","聂","晁","勾","敖","融","冷","訾","辛","阚","那","简","饶","空","曾","毋","沙","乜",
        "养","鞠","须","丰","巢","关","蒯","相","查","后","荆","红","游","竺","权","逮","盍","益","桓","公"
    },
    fxing = {
        "欧阳","太史","端木","上官","司马","东方","独孤","南宫","万俟","闻人","夏侯","诸葛","尉迟","公羊","赫连","澹台","皇甫",
        "宗政","濮阳","公冶","太叔","申屠","公孙","慕容","仲孙","钟离","长孙","宇文","城池","司徒","鲜于","司空","闾丘","子车",
        "亓官","司寇","巫马","公西","颛孙","壤驷","公良","漆雕","乐正","宰父","谷梁","拓跋","夹谷","轩辕","令狐","段干","百里",
        "呼延","东郭","南门","羊舌","微生","公户","公玉","公仪","梁丘","公仲","公上","公门","公山","公坚","左丘","公伯","西门",
        "公祖","第五","公乘","贯丘","公皙","南荣","东里","东宫","仲长","子书","子桑","即墨","达奚"
    },
    nanming = {
        "邦","宝","保","彪","彬","斌","波","伯","博","才","策","昌","超","琛","辰","晨","成","承","诚","春","达","德","东","栋",
        "发","飞","风","峰","福","富","刚","罡","功","固","冠","光","广","贵","国","海","翰","航","豪","浩","和","河","恨","亨",
        "恒","弘","宏","鸿","厚","华","辉","会","家","坚","建","健","江","杰","金","进","敬","军","钧","俊","康","克","朗","乐",
        "磊","力","利","良","梁","亮","林","龙","伦","轮","茂","民","明","鸣","楠","宁","朋","鹏","平","奇","启","谦","强","清",
        "庆","全","群","仁","荣","榕","若","山","善","绍","生","胜","盛","时","士","世","树","顺","思","松","泰","涛","腾","天",
        "维","伟","文","武","先","祥","翔","小","心","新","信","兴","星","行","雄","旭","学","言","岩","炎","以","义","毅","永",
        "勇","友","有","玉","裕","元","泽","哲","振","震","政","之","志","致","中","忠","壮","子"
    },
    nvming = {
        "爱","安","傲","白","柏","半","宝","贝","蓓","碧","璧","冰","波","采","彩","婵","痴","初","春","纯","聪","翠","代","黛",
        "丹","娣","蝶","冬","娥","儿","尔","凡","梵","芳","飞","菲","芬","风","枫","凤","芙","馥","谷","桂","海","含","涵","寒",
        "菡","荷","恨","红","华","骅","桦","怀","槐","欢","环","幻","卉","惠","慧","姬","寄","佳","嘉","剑","姣","娇","洁","婕",
        "金","锦","瑾","菁","晶","静","菊","娟","君","筠","苛","可","兰","岚","蓝","澜","乐","蕾","冷","莉","丽","荔","怜","莲",
        "琳","灵","玲","凌","菱","柳","露","璐","绿","玛","曼","眉","梅","美","妹","媚","梦","觅","妙","茗","慕","娜","南","妮",
        "念","凝","盼","沛","佩","飘","平","萍","琦","琪","绮","千","茜","倩","巧","芹","琴","勤","青","卿","清","晴","琼","秋",
        "荣","容","蓉","融","柔","如","蕊","瑞","睿","若","莎","山","珊","诗","书","淑","舒","双","霜","爽","水","烁","丝","思",
        "松","素","堂","桃","婷","彤","纨","宛","婉","琬","薇","苇","文","雯","问","希","惜","霞","夏","贤","娴","香","向","霄",
        "小","晓","笑","欣","新","馨","秀","萱","旋","雪","寻","雅","娅","烟","妍","琰","彦","艳","雁","燕","阳","洋","瑶","叶",
        "夜","伊","依","仪","宜","怡","以","忆","艺","亦","易","逸","英","莺","迎","滢","颖","影","映","咏","友","又","幼","宇",
        "羽","雨","语","玉","育","毓","元","园","苑","媛","瑗","月","悦","阅","云","芸","韵","昭","贞","珍","真","之","芝","枝",
        "芷","忠","珠","竹","紫","宗","醉"
    },
    placeName = {
        '定','德','容','卢','清','城','安','棱','祁','贤','西','弥','万','鄱','修','津','湖','临','林','佛','乌','悟','头','埠',
        '溪','远','迁','施','甘','新','锦','鱼','余','强','江','义','凤','武','崇','盖','南','金','波','洞','泽','阳','原','隆',
        '玉','云','山','鸡','泉','谷','颍','大','旗','水','淄','绛','海','曲','野','敦','首','望','彦','灵','子','源','拜','垣',
        '涧','口','川','庆','国','黄','吉','全','舟','乾','固','靖','马','济','烦','楼','彬','台','昭','扬','州','嵊','秦','孝',
        '嘉','平','浦','龙','蒙','乐','朔','政','福','乡','昌','茌','禄','淳','汶','东','广','宜','爱','田','淮','泗','千','开',
        '白','图','盱','泰','石','晋','闸','宁','文','沽','肇','化','常','五','长','神','磐','依','通','建','库','岚','四','无',
        '仙','双','富','镇','呼','沈','沭','光','连','邵','克','郸','洛','犹','洪','兴','泾','遵','孟','照','族','兰','凌','榆',
        '莱','明','宣','酒','古','敖','港','票','苍','青','绥','保','灯','河','木','英','贡','寿','合','溧','杨','华','治','丰',
        '徐','嫩','邹','上','春','和','启','考','洋','北','太','延','偏','店','梁','塞','尉','威','顺','桃','阴','师','陵','康',
        '蔡','张','响','宗','永','辰','邢','丹','姚','赣','集','奎','丽','招','沂','谋','岗','塔','宝','齐','高','厦','正','深',
        '罗','汇','章','居','边','邳','普','咸','梅','召','邑','鞍','自','渭','皇','菏','成','盐','三','密','蒲','铁','赉','左',
        '巴','闻','介','郯','个','繁','葛','暨','微','赤','夏','潜','尤','会','元','天','萨','满','钦','潼','樊','盈','樟','吴',
        '屯','澄','遥','阜','玛','芜','奉','桦','霍','卫','襄','团','舒','内','坪','里','法','岱','资','监','郎','门','扶','宿',
        '陶','吕','嵩','汉','睢','朝','周','伦','碑','任','濉','漯','承','岭','濮','坝','掖','恩','浠','池','勃','峰','沃','畲',
        '衡','浪','辽','冈','荣','苏','阿','博','舞','涟','辉','关','滁','商','勐','惠','香','丘','凉','诸','牟','绍','极','尚',
        '民','坛','礼','麻','沛','堰','冠','获','坊','行','骅','雄','们','讷','名','祥','黎','赵','抚','鹤','陀','旧','费','为',
        '登','亭','项','闽','十','滨','虞','辛','井','鼎','郓','莲','缙','汪','感','陆','眙','年','瑞','洮','竹','松','宕','芮',
        '怀','中','皋','信','间','邓','栗','涞','浑','弋','峪','裕','许','禹','呈','盘','进','庐','璧','偃','胜','良','邮','萍',
        '肥','交','歙','来','甸','唐','户','肃','铜','忻','墨','峡','邱','公','鼓','饶','力','至','珲','陉','黑','荫','湾','柘',
        '郧','善','同','桐','静','风','游','穴','如','彭','宇','汤','姜','益','娄','范','休','栾','砚','红','巢','徽','壶','谊',
        '巨','都','环','随','杭','剑','荆','魏','昆','漠','流','枣','屏','蛟','沾','当','逊','权','虎','堡','界','黟','府','闵',
        '利','畴','浮','沧','沁','孙','作','茅','格','彝','灌','柏','六','包','稷','米','汝','旬','泸','洼','岷','淇','壁','夷',
        '岳','尼','旌','征','韩','铅','勒','横','仁','汾','潢','银','漳','慈','莒','柳','九','廊','志','方','椒','柞','蚌','侯',
        '宾','昔','理','农','衢','绿','眉','皮','陇','浚','熟','运','仪','即','始','萧','狮','邯','勤','鹰','沟','庄','岛','麟',
        '干','垦','仓','树','本','岢','氏','涿','星','泌','象','封','沙','房','社','塘','郑','前','尧','滦','陕','度','泊','京',
        '胶','迭','鹿','思','滕','鄄','应','寨','句','枝','蔚','息','曹','锡','景','故','单','卓','磁','陟','萝','日','潞','梨',
        '杞','腾','营','峙','蓟','涂','霄','献','鄢','部','舆','功','亳','鲁','彰','遂','家','将','岩','伊','岐','芦','馆','霞',
        '巩','盂','秭','友','哈','载','荔','渑','煌','穆','汀','寻','达','勉','荥','翼','潭','巧','烟','冲','花','砀','洲','脂',
        '留','隰','涉','栖','诏','渡','柔','绩','淀','梦','君','郏','喜','紫','涡','拉','温','滑','略','淅','射','桥','棣','钢',
        '虹','乳','贵','代','朐','易','蓬','蓝','楚','佳','钟','潍','桓','霸','猗','藁','含','冶','碌','赞','蠡','冀','于','翔',
        '聊','叶','右','两','滋','莘','焦','苑','宫','兖','莆','坻','归','瓯','分','婺','坡','洱','确','鄂','蕲','枞'
    },
    placeSuf = {
        '谷','庄','镇','港','郡','城','县','府','洞','区','村','堡','阜','乡','崖','州','坊','岛','峰','陂','观','道','坝','坡','山'
    }
}

return globalName


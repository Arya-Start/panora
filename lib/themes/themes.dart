import 'package:flutter/material.dart';

final flashscreenTextStyle =
    TextStyle(color: Colors.black, fontSize: 35.0, fontWeight: FontWeight.w800);

TextStyle appBarTextStyle = TextStyle(color: Colors.black, fontSize: 24.0);
TextStyle titleTextStyle = TextStyle(color: Colors.black, fontSize: 20.0);
TextStyle subTitleStyle = TextStyle(color: Colors.black38, fontSize: 16.0);
TextStyle searchTextStyle = TextStyle(color: Colors.black38, fontSize: 16.0);

TextStyle hintStyle = TextStyle(color: Colors.black38, fontSize: 16.0);
TextStyle choiceTextStyle = TextStyle(color: Colors.red, fontSize: 16.0);
TextStyle kTitleText = TextStyle(color: Colors.black);
TextStyle kTitleTextStyle = TextStyle(color: Colors.black38, fontSize: 16);
TextStyle kEmptyTextStyle = TextStyle(color: Colors.black54, fontSize: 20);

const kBody1 = """

လူတွေ ပြောကြပါလိမ့်မယ်… အကြံပေးစကားတွေ၊ 
ဝေဖန်မှုတွေ၊ ကဲ့ရဲ့လှောင်ပြောင်မှုတွေ၊ ချီးကျူးစကားတွေ အမျိုးမျိုးပေါ့။ 
ကျွန်တော်လည်း တစ်ခါတစ်လေ ချီးကျူးစကားတွေမှာ 
သာယာနှစ်မြောတတ်သလို ဝေဖန်မှုတွေ အောက်မှာ စိတ်အားငယ်သွားတတ်တယ်၊ 
အကြံပေးစကားတွေနောက်မှာ ဝေခွဲမရ ဖြစ်ရပြန်တယ်။
ကျွန်တော်တို့ လူငယ်တွေဟာ စိတ်ခံစားလွယ်တယ်၊ စိတ်ထိခိုက်လွယ်တယ်၊ 
အောင်မြင်ချင်ဇောကြီးတယ်၊ စိတ်မြန်တယ် အဲလိုဗီဇလေးတွေ ရှိနေလေတော့ 
ဝေဖန်မှုတွေကို အရမ်းအာရုံစိုက်နေမိတာမျိုးတွေ၊ ချီးကျူးစကားတွေကြောင့် 
ဘဝင်လေဟပ်နေတာတွေ ဖြစ်တတ်ပါတယ်။ ပြီးတော့ သူများက 
ဒါကောင်းတယ်ဆိုတိုင်း လွယ်လွယ်ကူကူယုံ၊ နင်ကဘယ်နေရာ 
ဘာဖြစ်နေတယ်ဆိုတိုင်း အရမ်းတွေ စိတ်ညစ်သွားတာမျိုး… 
သူများပြောတိုင်း လွယ်လွယ်နားယောင်တတ်တာလေးကို ပြင်ဖို့ လိုပါတယ်။ 
အဓိက ကိုယ့်ကိုယ်ကိုယ် စဉ်းစားချင့်ချိန်ဖို့ရယ်၊ ကိုယ်ပိုင်ဆုံးဖြတ်ချက် ချဖို့ရယ်၊ 
ယုံကြည်မှုရှိဖို့ကို မမေ့ပါနဲ့။ ဘယ်သူတွေ ဘာပြောပြော ကိုယ့်ဘဝရဲ့ လမ်းကြောင်းက 
ကိုယ့်ဆုံးဖြတ်ချက်အတိုင်း သွားမှာမို့ ကြားရသမျှကို မျက်စိမှိတ် မယုံလိုက်ပါနဲ့နော်။ 
ဒီအချက်ကတော့ ကျွန်တော်ကိုယ်တိုင်လည်း ပြင်ဖို့လိုနေတာမို့ အတူူတူပြင်ပြီး ကြိုးစားကြတာပေ့ါ။

""";

const kBody2 = """
လူငယ်ဘဝမှာ ကိစ္စတော်တော်များများက 
ခက်ခဲနေတာ မှန်ကောင်း မှန်ပါလိမ့်မယ်။ 
တကယ့်ဘဝထဲ ခြေစုံပစ် ဝင်လာကြရတဲ့အခါ 
စိန်ခေါ်မှုတွေနဲ့ ခယောင်းလမ်းကို ကျွန်တော်တို့ 
ဖြတ်လျှောက်ရတတ်တာ သဘာဝတစ်ခု ဖြစ်ပါတယ်။ ဆ
ိုတော့ အရာအားလုံးကို ကျွန်တော်တို့ အပြစ်တင်နေလို့ မရပါဘူး။ 
အခုခေတ်မှာ ဖြစ်နေကြတာက ဘာကိစ္စပဲ ဖြစ်လာ ဖြစ်လာ 
Depression ဝင်သွားပြီ ဆိုတဲ့စကားကို လွယ်လွယ်သုံးတတ်ကြတာပါ။ 
ဒီနေရာမှာ စိတ်ညစ်တာနဲ့ Depression ကို မမှားစေချင်ပါဘူး။ 
Depression ဆိုတာ လုပ်ယူရတဲ့အရာ မဟုတ်သလို 
အပျော်တမ်း ကစားစရာလည်း မဟုတ်ပါဘူး။ 
ကိုယ့်ကိုယ်ကိုယ် စိတ်ကျရောဂါဇာတ် မသွင်းပါနဲ့။ 
စိတ်ညစ်စရာတွေ ပြဿနာတွေဆိုတာ ကျွန်တော်တို့ ရင်ဆိုင်ရမယ့်အရာ၊ 
ဖြေရှင်းရမယ့်အရာ၊ ကျော်လွှားရမယ့်အရာ၊ သင်ခန်းစာယူရမယ့်အရာတွေ ဖြစ်ပါတယ်။ 
ဒါကြောင့် ခက်ခဲပေမယ့် ဒါတွေကြုံလာရင် Depression ဆိုတဲ့ စကားနောက်မှာ ပုန်းမနေပါနဲ့။ 
ဒါဟာလည်း ကိုယ့်ကိုယ်ကိုယ် လိမ်ညာနေတာပဲမို့ ကိုယ်တိုင်သေချာ စဉ်းစားပါနော်။

""";

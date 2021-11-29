//
//  ViewController.swift
//  blog app by mohammed ali
//
//  Created by Hassan Yahya on 19/04/1443 AH.
//


import SwiftUI
struct Contentview: View {
    
    let gradient = Gradient(colors: [.primary,.init(white: 40.8)])
    var body: some View {
      
        
        TabView {
            MainView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                    
                }
            
            AllPosts()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("See all")
                }
}
}
}



struct ContenView_Previews: PreviewProvider {
    static var previews: some View {
        Contentview()
    }
}

struct AllPosts: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(latestpost) {post in
                    NavigationLink(destination: BlogPostView(blogPost: post)) {
                    BlogPostCardList(blogPost: post)
                }
                }
            }
            .navigationTitle("مقالات")
            .listStyle(InsetListStyle())
        }
      
    }
}

struct AllPosts_Previews: PreviewProvider {
    static var previews: some View {
        AllPosts()
    }
}

struct BlogPostCardList: View {
    var blogPost: BlogPosts
    
    var body: some View {
        
                
        VStack(alignment: .leading) {
            Image(blogPost.image)
            
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity)
                .frame(height: 180)
                .frame(maxWidth: UIScreen.main.bounds.width - 60)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            
            
            
            VStack(spacing: 6) {
                HStack {
                    Text(blogPost.name)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(3)
                        .font(Font.title2.bold())
                        .foregroundColor(.primary)
                    Spacer()
                }
                
                
                HStack {
                    Text(blogPost.details)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(3)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Spacer()
                    
                }
            }
        }
        .frame(maxWidth: UIScreen.main.bounds.width - 60, alignment: .leading)
        .padding()
        
                
       
    }
}


struct BlogPostCardList_Previews: PreviewProvider {
    static var previews: some View {
        BlogPostCardList( blogPost: BlogPosts(id: 1, name: "Adobo", image: "1", details: "Sample Details"))
    }
}

struct MainView: View {
    var body: some View {
        NavigationView{
            ScrollView{
                
                VStack{
                    HStack{
                        Text("المقالات")
                            .font(.title.bold())
                        Spacer()
                    }
                
                    LazyVStack {
                        
                        
                        ForEach(featuredpost) { post in
                            //text(post.name)
                            NavigationLink(destination: BlogPostView(blogPost: post)) {
                            BlogPostCardMin(blogPost: post)
                        }
                    }
                        }
                    
                    
                .padding(.horizontal, 15)
                .padding(.vertical, 30)
                
                //letest articles
                
                        Text("اخر المقالات")
                            .font(.title.bold())
                        Spacer()
                    }
                
                
                    .padding(.horizontal, 15)
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 15) {
                            
                            if latestpost.count >= 3 {
                                ForEach(latestpost[0...2]) { post in
                                    NavigationLink(destination: BlogPostView(blogPost: post)) {
                                BlogPostCardMin(blogPost: post)
                                    }
                            }
                            }else {
                                ForEach(latestpost[0..<latestpost.count]) { post in
                                    NavigationLink(destination: BlogPostView(blogPost: post)) {
                                    
                                    BlogPostCardMin(blogPost: post)
                                    }
                              

                
                        }
                    }
                }
                .padding(.horizontal, 15)
                .padding(.vertical, 30)
            }
            .frame(height: 420)
                Spacer()
            }
            .padding(.bottom,40)
            }
            .navigationBarTitle("Home")
            .navigationBarItems(
           trailing: Button(action: {}) { Image(systemName: "arrow.clockwise.circle.fill")
                   .resizable()
                   .frame(width: 30, height: 30)
                
            })
        }
  


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}


}
extension Color {
    init(hex: String){
        
        
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        
        switch hex.count {
            
        case 3:// RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17,(int & 0xF) * 17)
            
        case 6:// RGB (24-bit)
                (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
            
        case 8:// RGB (32-bit)
                (a, r, g, b) =  (int >> 24, int >> 4 & 0xFF , int >> 8 & 0xFF , int & 0xFF)
            
            
        default:
            (a, r, g, b) = (1, 1, 1, 0)

        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
            
            )
    }
    }




struct BlogPosts :Identifiable {
    
    var id : Int
    var name : String
    var image : String
    var details : String
    let imgblog = UIImageView()
}




var latestpost = [
BlogPosts(id: 0,
          name: "الاستمتاع بالحياة ",
          image: "01",
          details: " ملء أوقات الفراغ بالهوايات، والأعمال التي يهواها القلب؛ حيث يساعد ذلك على زيادة الإنجاز، وإدخال البهجة إلى القلب، أما قضاء أوقات الفراغ بالنوم، والجلوس فهذا مما يلحق الضرر بالإنسان، ويجعله غير قادر على الاستفادة من وقت فراغه بالشكل الأمثل، والمطلوب"),

BlogPosts(id: 1,
          name: "الفلسفة والاغنية الشعبية",
          image: "02",
          details: "ترتبط الفلسفة بالأغاني كما ترتبط بالشعر والرواية والفيلم والكثير من مظاهر الحياة، الفنية وغير الفنية. غير أن الملاحظ أن الفلسفة ترتبط، في الغالب، بالكوميديا أكثر من التراجيديا، وبالشر أكثر من الخير، وبالشعبي أكثر من العاطفي والوطني. ربما لأن القسمة الثنائية التي ذكرناها تفصل بين ما يستدعى التفكير وما يستدعى العاطفة، وأن الفصل ليس حاداً، والأمثلة ليست منضبطة، وإنما نوردها على سبيل التقريب."),

BlogPosts(id: 2,
          name: "الهوية الثقافية ",
          image: "03",
          details: "تصنف مجالات التراث الشعبي وموضوعاته حسب الدكتور محمد الجوهري الى الأدب الشعبي، العادات والتقاليد، المعتقدات والمعارف الشعبية، الثقافة المادية والفنون الشعبية، وتعد الحكايات الشعبية من أكثر فنون الأدب الشعبي انتشاراً، وأهم أنواعها والتي تصنف إلى الحكاية الخرافية، حكاية المعتقدات، حكايات التجارب اليومية، الحكايات التاريخية، قصص الحيوان، الحكايات الهزلية، والقصص الدينية.. وهي إحدى الوسائل التي تحافظ على الإرث الثقافي وترسيخ الهوية الثقافية ومن أهم الأشكال التعبيرية وهي خلاصة تجارب الأجيال مصوغة في قالب قصصي مشوق، زاخر بالعبر والقيم النبيلة وهي من إبداع الخيال تتجلى فيها حكمت المجتمع، فهي مرآة عاكسة للمجتمع التي نبتت فيه بحيث تعتبر الحكاية الشعبية أحد أجناس الأدب الشعبي المحببة للكبار والصغار، وذلك لما تتضمنه من عناصر جذب وتشويق وإثراء للخيال بالإضافة إلى ما تتضمنه من قيم إيجابية تسعى إلى بثها في نفوس الأطفال"),

BlogPosts(id: 4, name: "انقاذ الوعي", image: "04", details: "لعل أيّ شخص يقوم بتدريس اللغات والآداب اليوم في المدارس الثانوية أو في الجامعات يدرك حجم الصعوبات التي تواجه الطلاب عند محاولتهم قراءة وفهم النصوص ذات الطابع الأدبي، فقد أصبح من الصعب على الشباب الذين تتراوح أعمارهم بين 14 و23 عامًا استيعاب الأفكار الأساسية للنص، وفهم الفروق الدقيقة، فضلًا عن قراءة ما بين السطور، وإقامة روابط بين طبقات المعنى داخل النص وبين النص وواقعه وسياقاته المختلفة، والنفاذ إلى المعاني العميقة التي لا تمنح نفسها على الفور من القراءة الأولى المتعجلة"),

BlogPosts(id: 3,
          name: "الخيال والانسان",
          image: "05",
          details: "يمكن الحديث عن حضور الكوارث في مختلف المناحي الحياتية، فأينما تلفّتّ من حولك يمكن التعثّر بكوارث محدقة بك، تسعى لمحاصرتك، وهي تختلف بحسب الشخص، فلكلّ امرِئ كوارثه الخاصة أيضاً ضمن المشهد العام، لكن يبدو لي أنّ من أخطر أنواع الكوارث تلك التي تقعد الإنسان عن المحاولة، وتعدم في روحه رغبة البحث عن سبل لتلافيها، وتبقيه رهين التحجّر والانغلاق، وهو ما يمكن تسميته بالموات، أو بحياة مجمّدة معلّقة لا وجود فعلياً فيها للمقاومة أو المغامرة."),

BlogPosts(id: 5,
          name: "العين والاثر",
          image: "06",
          details: "ارتبط شِعرُ المُعلَّقات بالأطلال (آثار الديار) ارتباطًا وثيقًا. فالديارُ المهجورةُ والرسومُ الباليةُ والأطلالُ الخاليةُ كلها مرتكزات أساسية في فلسفة الشِّعر العربي القديم. والقضيةُ ليست قضيةَ حجارة وتراب، وإنما هي قضية أعمار جميلة هاربة بلا عودة، وذكريات دافئة مختبئة في زوايا الذاكرة السحيقة، وآثار الأحبة الذين تركوا بصمتهم في النَّفْس الشاعرة ثم غابوا في طوايا الزمن."),

BlogPosts(id: 6, name: "انهيار تربية البيت", image: "07", details: "يعرف المجتمع المعاصر تغيرات جذرية في كل المجالات، وأضحت السمة المميزة له اليوم هي ”المعرفة”، وبالتالي أصبحت الحاجة ماسة إلى البحث عن طرائق ومناهج في التربية تُساير هذا التطور، في مجتمع بأبعاد متعددة، يفرض على المربّي الانفتاح على كل التصورات والأفكار التي تُغني العملية التربوية، خاصة وأننا نعيش على وقع تنامي القضايا والمستجدات، التي لم يوجد لها مثيل في الماضي، وتتطلب رسوخا في مجال التربية لإيجاد مسالك آمنة تنقل الإنسان المعاصر من ضيق الرؤيا إلى سعتها، بشكل يضمن للمربي نجاح الفعل التربوي."),

]
 var featuredpost = [
    
    BlogPosts(id: 0, name: "الذهنية الدينية الراهنة وتحولاتها الكارثية",
              image: "08",
              details: "ها نحن مرة أخرى نتحدث عن الذهنية بوصفها طريقة في التفكير معززة بالسلوك. وبهذا المعنى نحن لا نتحدث عن صفة وراثية خارجية لا قيمة لها بل عن ذهنية عميقة. فليس كل منتمٍ إلى السنّة يفكر سنيّاً، ولا كل منتمٍ إلى الشيعة يفكر شيعيّاً، ولا كل من يدين بالمسيحية يفكر مسيحياً وهكذا… فمن الطبيعي أن تكون الذهنية العقلية – الفلسفية والجدلية مختلفة عن الذهنية الدينية بوصفها هي الأخرى طريقة في التفكير."),

    BlogPosts(id: 1, name: "الوجه الوحشي للمثقف النقدي",
              image: "09",
              details: "على الرغم من أن المفكرين والفلاسفة والمثقفين، الغربيين تحديدا، برعوا في إنتاج مقولات كبرى ونصوص عظمية تملأ اليوم رفوف المكتبات وأسواق الكتب، ويجري تدوير أسماء أصحابها في الملتقيات العلمية والاستشهاد بها فيما بين دفات المتون البحثية عبر أطراف العالم الأربعة، حتى ذهب بعض المتحمسين لإرث هؤلاء الفكري والمعرفي إلى تعظيمهم وسكب هالة القداسة عليهم من قدح المحبة العلمية، إلا أن الغرفة الخلفية لحياة هؤلاء العظماء الذين تربعوا على عرش الفكر والمعرفة لم تكن بتلك النظارة العلمية التي اشتهروا بها وعرفهم بها الناس، فكثير منهم كانوا خلافا للصورة المقدسة عنهم، حين يلقون عنهم رداء الوقار الفكري والثقافي وينتكسوا إلى ذوات عارية من الأخلاق منغمسة في الشهوات والملذات دون وازع أو ضابط، كأنها وحوش بشرية أطلقت من عقالها ، فكشفوا بممارساتهم المشينة عن شخصيات مضطربة أو مزاجية أو فاسدة، لذلك من نافلة القول أن نشير هنا إلى أن حياة العقل لا تقود – بالضرورة – إلى حياة عقلانية، فقد يكون المفكر أو الفيلسوف أو المثقف إجمالا، يعيش في سرّه حياة مناقضة للأفكار والأطاريح التي نذر نفسه للترويج لها والدفاع عنها في العلن، وهنا أجدني ألوك عبارة قالها الفيلسوف الفرنسي لوك فيري للتعبير عن استيائه من سلوكات بعض المثقفين الجانحة والمتناقضة “إن الثقافة لا تمنع أحدا من أن يكون سافلا”، وهذا طبعا في غياب الضمير أو الأخلاق أو الدين، فالمعرفة على قولة جون جاك روسو لا تولد الأخلاق والأفراد المثقفون ليسوا بالضرورة صالحين، لأن هؤلاء في نهاية المطاف مخلوقات بشرية، قد يخضعون في سلوكاتهم لإملاءات ونوازع النفس دون مقاومة، ولا يمكن أن نقرن التقدم الحضاري والفكري الذي يعرفه الغرب بالرقي الأخلاقي للأفراد الذين ينعمون بثمار ذلك، حيث ذهب لوك فيري إلى أن المزاعم التي ترى بأن تقدم الحضارة وتقدم الأخلاق رديفان، هو أكبر وهم ورثه الغرب عن عصر الأنوار، فالتربية الأخلاقية لا صلة لها بالتكوين الفكري ولا بالثقافة ( مجلة الدوحة،ع 134،2018، ص46.)."),
    
    BlogPosts(id: 2, name: "لسان جديد أم بلاغة جديدة",
              image: "10",
              details: "دارت النقاشات الأكاديمية وتدور منذ عقود حول المنهج الذي ينبغي أن نتعامل به مع اللغة وأقصد هنا اللسان؛ أي المشترك الجماعي من حيث هو حصيلة للمنجزات والاستعمالات الكلامية من الأفراد المتخاطبين المنتمين إلى مجال لغوي واحد، وهو في هذه الحال اللغة العربية، فبين من يرى أن اللغة الفصحى بقواعدها وأصولها المعيارية واستخداماتها الأصلية هي اللغة التي يجب أن يُحتكم إليها انطلاقا من مبدأ “الصواب والخطأ اللغوي”، ومن يرى أن اللغة ما هي إلا حصيلة تطورات وتغيرات تاريخية ومجتمعية وأن مبدأ “التواضع والاصطلاح” بمفهومه العام هو المبدأ الذي ينبغي أن يرجع إليه في تصوّر ماهية اللغة نفسها، وأصحاب التوجّه الأول هم المعياريون الذين يعدّون اللغة العربية الفصحى مقياسا لإنتاج الخطاب اللغوي واستقباله، ويرون أن العاميات في الأصل لحن، وليست من باب التطور اللغوي، على معنى أنها أخطاء في استعمال العربية إضافة إلى ما يلحق هذه العاميات من إدراج للغات أخرى، وتركيب غير مستساغ بين الفصحى والعامية، وبين الفصحى وغيرها من اللغات واللهجات."),
    
    BlogPosts(id: 3,
              name: "الوطني هو الكوني",
              image: "11",
              details: "نكتب عن الثقافة الوطنية كي لا نقع أسرى الوهم في أن هناك مؤامرة عالمية تسعى للنيل من الثقافة العربية، وكي لا نسقط فيما يسميه البعض الغزو الثقافي الذي قد يؤدي إلى نوع من التعصب، وتجاهل الملامح القانونية لسيرورة الثقافة والنظر إلى كل فكرة أو أيديولوجيا أو فلسفة أوروبية تمارس تأثيرها على أنه غزو ثقافي أوربي – غربي، يستدعي التحصن خلف «التراث الأصيل»."),

    BlogPosts(id: 4,
              name: "وول سوينكا والهوس بالجحيم ", image: "12",
              details: "أعلنت الحكومة الإيطالية يوم الخامس والعشرين من مارس يوما وطنيا لإحياء ذكرى الشاعر الكبير دانتي أليغييري حيث يعد الشاعر التوسكاني الأب الأول للغة الإيطالية، وقد تم اختيار يوم الـ25 من مارس لأنه، وفقًا للباحثين، كان التاريخ الذي بدأ فيه دانتي رحلته إلى الآخرة كما رواها في ملحمته الأشهر “الكوميديا”، والتي وصفها لاحقا جيوفاني بوكاتشيو، وهو أب آخر من آباء الأدب الإيطالي وأول من كتب سيرة دانتي، بـ”الإلهية”."),

    BlogPosts(id: 5,
              name: "الذات والحقيقة التواصلية",
              image: "13",
              details: "إن أسوأ الحوارات والنقاشات والاختلافات تلك المتعلقة بالحقيقة وتعريفها، والأسوأ من هذا انشغال بعض الفلاسفة أو العلماء – الذين اقتحموا حقل الفلسفة وظلوا علماء – بالحقيقة العلمية. وسأبدأ بالأسوأ من هذا الانشغال لأبرز سوءه لا للدخول في نقاش حول الحقيقة العلمية. وعندي إنه من العبث الذي لا معنى له السؤال فيما إذا كانت هناك حقيقة علمية أو لا، فحقائق العلوم الطبيعة قابلة للشك لأنها حقائق. فلولا التصديق بالحقيقة العلمية بأنها حقيقة الموضوع لما كان هناك تقنية قادت الإنسان للوصول إلى القمر. إن صناعة سفينة فضاء ومعرفة الفضاء والإقرار بالحقائق المحيطة بالأرض والقمر هو الذي أدى إلى الاحتفال وإلى أن ارمسترونغ على ظهر القمر ."),

    BlogPosts(id: 6,
              name: "الغايب الاكبر",
              image: "14",
              details: "يطرح علينا عنوان هذا المقال مناقشة التساؤل التالي: كيف نمارس حرفة علم الاجتماع بعد مضي أكثر من قرن يفصلنا عن المحاولات الأولى لتحديد المسار العلمي والاجتماعي لعلم الاجتماع؟ فلا تزال لغاية اليوم تطرح قضية التزام عالِم الاجتماع المثيرة للجدل تساؤلات عديدة حول ممارسته لعلم الاجتماع وغاياتها. فعلى سبيل المثال يقف معظم علماء الاجتماع على تخوم السياسيين، وعلى مقربة أشدّ مما يظنون من أصحاب القرار. أليس ذلك ينذر بوقوع عالِم الاجتماع ذاته في الشَّرَكِ فيجبر على اتخاذ موقف ما؟ وبالتالي تسييس نتائج بحثه وتوصياته حول دراسة الواقع الاجتماعي."),

   

 ]
struct BlogPostCardMin: View {
    @Environment(\.colorScheme) var colorSheme
    var blogPost: BlogPosts
    var body: some View {
        
        
        
        
        VStack (alignment: .leading){
            Image(blogPost.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 220)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 20,style: .continuous))
            
            
            VStack(spacing: 6) {
                HStack {
                    Text(blogPost.name)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(3)
                        .font(Font.title2.bold())
                        .foregroundColor(.primary)
                    Spacer()
                }
                HStack {
                    Text(blogPost.details)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(3)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Spacer()
                }
            }
            .frame(height: 110)
        }
        .padding(15)
        .background(colorSheme == .dark ? Color(hex: "#121212") : Color.white)
        .frame(maxWidth: UIScreen.main.bounds.width - 50, alignment: .leading)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: colorSheme == .dark ? .white.opacity(0.01) : .black.opacity(0.1), radius: 15, x: 0, y: 5)
    }
}

struct BlogPostCardMin_Previews: PreviewProvider {
    static var previews: some View {
        
        BlogPostCardMin(blogPost: BlogPosts(id: 1, name: "Adobo", image: "1", details: "Smple Details"))
    }
}

struct BlogPostView: View {
    var blogPost: BlogPosts
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    
                    Image(blogPost.image)
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 310)
                        .frame(maxWidth: UIScreen.main.bounds.width)
                        .clipped()
                    
                    VStack {
                        HStack {
                            Text(blogPost.name)
                                .font(.title3)
                                .fontWeight(.heavy)
                                .foregroundColor(.primary)
                                .lineLimit(3)
                                .padding(.vertical, 15)
                            Spacer()
                        }
                        
                        .frame(maxWidth: .infinity)
                        Text(blogPost.details)
                            .multilineTextAlignment(.leading)
                            .font(.body)
                            .foregroundColor(Color.primary.opacity(0.9))
                            .padding(.bottom, 25)
                            .frame(maxWidth: .infinity)
                    }
                    
                    .padding(.horizontal, 20)
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                        }
            .navigationBarTitleDisplayMode(.inline)
                    }
                }
}


    struct BlogPostView_Previews: PreviewProvider {
    static var previews: some View {
        
        BlogPostView( blogPost: BlogPosts(id: 1, name: "adobo", image: "1", details: "sample Datails"))
    }
}

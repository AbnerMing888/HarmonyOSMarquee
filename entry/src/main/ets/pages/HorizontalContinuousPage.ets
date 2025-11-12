import { MarqueeDirection, MarqueeType, MarqueeView } from '@abner/marquee'
import { ActionBar } from './ActionBar'

/**
 *AUTHOR:AbnerMing
 *INTRODUCE:横向连续跑马灯，以数组形式滚动，支持任意自定义视图
 */
@Entry
@Component
struct HorizontalContinuousPage {
  private marqueeDataArray: string[] = [
    "公告：我是测试消息第一条",
    "公告：我是测试消息第二条",
    "公告：我是测试消息第三条"
  ]

  /**
   *AUTHOR:AbnerMing
   *INTRODUCE:可以是任意布局
   */
  @Builder
  marqueeText(item: string, _: number) {
    Text(item)
      .fontSize(16)
      .fontWeight(FontWeight.Bold)
      .margin({ left: 5 })
      .width("100%")
      .height(50)

  }

  /**
   *AUTHOR:AbnerMing
   *INTRODUCE:可以是任意布局
   */
  @Builder
  marqueeLayout(item: string, _: number) {
    Row() {
      SymbolGlyph($r('sys.symbol.bell_fill'))
        .fontSize(18)
        .renderingStrategy(SymbolRenderingStrategy.SINGLE)
        .fontColor([Color.Red])
        .margin({ left: 5 })
      Text(item)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ left: 5 })
    }.width("100%")
    .height(50)
  }


  /**
   *AUTHOR:AbnerMing
   *INTRODUCE:可以是任意布局
   */
  @Builder
  marqueeLayout2(item: string, _: number) {
    Column() {
      Image("https://loveharmony.oss-cn-beijing.aliyuncs.com/banner/banner_01.jpg")
        .width("100%")
        .height(100)
      Text(item)
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ left: 5, top: 10 })
    }.width("100%")
    .padding(10)
  }

  build() {
    Column() {
      ActionBar({ title: "横向连续跑马灯" })

      //纯文本
      MarqueeView({
        marqueeData: this.marqueeDataArray, //可以传递任意类型数据数组
        marqueeType: MarqueeType.continuous, //连续滚动
        marqueeDirection: MarqueeDirection.horizontal, //横向
        marqueeLayout: (item: Object, index: number) => {
          this.marqueeText(item as string, index)
        }
      }).border({ width: 1, color: Color.Red })

      //自定义布局1
      MarqueeView({
        marqueeData: this.marqueeDataArray, //可以传递任意类型数据数组
        marqueeType: MarqueeType.continuous, //连续滚动
        marqueeDirection: MarqueeDirection.horizontal, //横向
        marqueeLayout: (item: Object, index: number) => {
          this.marqueeLayout(item as string, index)
        }
      }).border({ width: 1, color: Color.Red })
        .margin({ top: 20 })

      //自定义布局2
      MarqueeView({
        marqueeData: this.marqueeDataArray, //可以传递任意类型数据数组
        marqueeType: MarqueeType.continuous, //连续滚动
        marqueeDirection: MarqueeDirection.horizontal, //横向
        marqueeLayout: (item: Object, index: number) => {
          this.marqueeLayout2(item as string, index)
        }
      }).border({ width: 1, color: Color.Red })
        .margin({ top: 20 })

    }
    .height('100%')
    .width('100%')
    .padding({ left: 10, right: 10 })
  }
}
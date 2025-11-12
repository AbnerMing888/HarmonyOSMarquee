import { MarqueeDirection, MarqueeType, MarqueeView } from '@abner/marquee'
import { ActionBar } from './ActionBar'

/**
 *AUTHOR:AbnerMing
 *INTRODUCE:横向停顿跑马灯，以数组形式滚动，支持任意自定义视图,固定左边的视图案例
 */
@Entry
@Component
struct HorizontalPauseFixedPage {
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
  marqueeLayout(item: string, _: number) {
    Text(item)
      .fontSize(16)
      .fontWeight(FontWeight.Bold)
      .width("100%")
      .height(50)
  }

  build() {
    RelativeContainer() {
      Column() {
        ActionBar({ title: "横向停顿跑马灯" })
        Text("在跑马灯组件左右可以固定想要的视图，就可以实现只滚动内容")
          .fontSize(14)
          .fontColor(Color.Red)
          .padding({ left: 20, right: 20 })
          .textAlign(TextAlign.Center)
      }

      Row() {
        SymbolGlyph($r('sys.symbol.bell_fill'))
          .fontSize(18)
          .renderingStrategy(SymbolRenderingStrategy.SINGLE)
          .fontColor([Color.Red])
          .margin({ left: 5, right: 5 })

        MarqueeView({
          marqueeData: this.marqueeDataArray, //可以传递任意类型数据数组
          marqueeDirection: MarqueeDirection.horizontal,
          marqueeType: MarqueeType.pause,
          marqueeLayout: (item: Object, index: number) => {
            this.marqueeLayout(item as string, index)
          }
        })
      }
      .border({ width: 1, color: Color.Red })
      .margin({ left: 10, right: 10 })
      .alignRules({
        center: { anchor: '__container__', align: VerticalAlign.Center },
        middle: { anchor: '__container__', align: HorizontalAlign.Center }
      })
    }
    .height('100%')
    .width('100%')
  }
}
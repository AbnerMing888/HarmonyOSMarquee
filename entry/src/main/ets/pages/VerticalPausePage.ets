import { MarqueeType, MarqueeView } from '@abner/marquee'
import { ActionBar } from './ActionBar'

/**
 *AUTHOR:AbnerMing
 *INTRODUCE:纵向停顿跑马灯，以数组形式滚动，支持任意自定义视图
 */
@Entry
@Component
struct VerticalPausePage {
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

  build() {
    RelativeContainer() {
      ActionBar({ title: "纵向停顿跑马灯" })

      Column() {
        MarqueeView({
          marqueeData: this.marqueeDataArray, //可以传递任意类型数据数组
          marqueeType: MarqueeType.pause,
          interval:1000,
          marqueeLayout: (item: Object, index: number) => {
            this.marqueeLayout(item as string, index)
          }
        })
      }.border({ width: 1, color: Color.Red })
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
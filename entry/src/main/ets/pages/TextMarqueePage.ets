import { MarqueeView } from '@abner/marquee'
import { ActionBar } from './ActionBar'

/**
 *AUTHOR:AbnerMing
 *INTRODUCE:纯文本跑马灯
 */
@Entry
@Component
struct TextMarqueePage {
  @State marqueeTextStart: boolean = true
  @State marqueeTextFromStart: boolean = true

  build() {
    Column() {
      ActionBar({ title: "纯文本跑马灯" })

      MarqueeView({
        marqueeText: "我是一段纯文本内容，主要用来展示跑马灯效果，来吧，我们一起看一下吧",
        marqueeStart: this.marqueeTextStart, //控制是否播放
        marqueeFromStart: this.marqueeTextFromStart, //控制方向
      }).margin({ top: 50 })

      Row() {
        Button("播放")
          .onClick(() => {
            this.marqueeTextStart = true
          })
        Button("暂停")
          .margin({ left: 5 })
          .onClick(() => {
            this.marqueeTextStart = false
          })
        Button("从左往右")
          .margin({ left: 5 })
          .onClick(() => {
            this.marqueeTextFromStart = true
          })
        Button("从右往左")
          .margin({ left: 5 })
          .onClick(() => {
            this.marqueeTextFromStart = false
          })
      }.margin({ top: 20 })
    }
    .height('100%')
    .width('100%')
  }
}
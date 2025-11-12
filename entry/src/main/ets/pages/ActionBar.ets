/**
 *AUTHOR:AbnerMing
 *DATE:2025/11/11
 *INTRODUCE:
 */
@ComponentV2
export struct ActionBar {
  @Param title: string = ""
  @Param hideBack: boolean = false

  build() {
    RelativeContainer() {

      Text("返回")
        .fontColor("#666666")
        .fontWeight(FontWeight.Bold)
        .fontSize(14)
        .visibility(this.hideBack ? Visibility.None : Visibility.Visible)
        .alignRules({
          center: { anchor: "__container__", align: VerticalAlign.Center }
        })
        .margin({ left: 10 })
        .onClick(() => {
          this.getUIContext().getRouter().back()
        })

      Text(this.title)
        .fontColor("#222222")
        .fontWeight(FontWeight.Bold)
        .fontSize(16)
        .alignRules({
          center: { anchor: "__container__", align: VerticalAlign.Center },
          middle: { anchor: "__container__", align: HorizontalAlign.Center }
        })
    }
    .width("100%")
    .height(50)
  }
}
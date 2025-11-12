import { ActionBar } from './ActionBar'

@Entry
@Component
struct Index {
  private titleArray: string[] = [
    "纯文本跑马灯",
    "纵向停顿跑马灯", "纵向停顿跑马灯[固定]",
    "横向停顿跑马灯", "横向停顿跑马灯[固定]",
    "纵向连续跑马灯",
    "横向连续跑马灯"]
  private routerArray: string[] = [
    "pages/TextMarqueePage",
    "pages/VerticalPausePage",
    "pages/VerticalPauseFixedPage"
    , "pages/HorizontalPausePage",
    "pages/HorizontalPauseFixedPage"
    , "pages/VerticalContinuousPage"
    , "pages/HorizontalContinuousPage"]

  build() {
    Column() {
      ActionBar({ title: "跑马灯案例", hideBack: true })
      Grid() {
        ForEach(this.titleArray, (item: string, index: number) => {
          GridItem() {
            Text(item)
              .width("100%")
              .height(50)
              .border({ width: 1, color: Color.Red })
              .textAlign(TextAlign.Center)
          }.onClick(() => {
            this.getUIContext().getRouter().pushUrl({ url: this.routerArray[index] })
          })
        })
      }.columnsTemplate("1fr 1fr")
      .rowsGap(10)
      .columnsGap(10)
    }.width("100%")
    .height("100%")
    .padding({ left: 10, right: 10 })
    .justifyContent(FlexAlign.Center)
  }
}
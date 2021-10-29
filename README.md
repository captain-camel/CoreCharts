# CoreCharts

CoreCharts is a package for creating beautiful and informational charts in SwiftUI.

![Screenshot](Assets/Screenshot.png)

# Usage

Each chart can be used as a regular SwiftUI view in your other views.

```swift
BarChart(data: [1, 2, 3, 4, 5, 4, 3, 2, 1])
```

### Combining charts

You can combine multiple charts into one using the `ChatView` view.

```swift
ChartView {
    LineChart(data: lineChartData)
    BarChart(data: barChartData)
}
```

# Charts

Core charts currently includes 3 different charts with unique properties and uses.

### Bar chart

A bar chart displays one bar for each provided data point. Each bar extends up or down all the way to 0 on the Y axis.

```
BarChart(data: [Double])
```

### Line chart

```
LineChart(data: [Double])
```


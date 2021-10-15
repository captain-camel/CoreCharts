# CoreCharts

CoreCharts is a package for creating beautiful and informational charts in SwiftUI.

![Screenshot](Assets/Screenshot.png)

# Usage

To render a chart, craete some chart inside of a `ChartView`.

```
ChartView {
    LineChart(data: [1, 2, 3, 4, 5, 4, 3, 2, 1])
}
```

# Charts

Core charts currently inclused 2 different charts, with many more on the way.

### Line chart

```
LineChart(data: [Double])
```

### Bar chart

```
BarChart(data: [Double])
```

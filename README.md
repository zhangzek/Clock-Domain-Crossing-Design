"# Clock-Domain-Crossing-Design" 
use MCP formulation without feedback
基于MCP不带反馈的跨时钟域设计

跨时钟域电路设计使用广泛，一直以来都是一个重要且复杂的问题，传统的做法一般为两级寄存器或是握手，这也成为了很多问题的根源。本例使用MCP（Multi-Cycle Path）Formulation，多周期路径去同步，可跨时钟域同步多个位。但是，有一个问题是，源时钟域中的逻辑如何知道何时可以发送另一段数据？就需要带反馈确认来增强（MCP）同步。
doc$paper文件夹由4篇文章供参考阅读，可以花更多的时间去阅读CummingsSNUG2008Boston_CDC.pdf
以后更新带反馈的MCP
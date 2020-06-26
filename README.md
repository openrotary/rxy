# Session

**描述**： 对`sessionStorage`封装,可存储对象,设置过期时长(总的描述)

### get

**描述**： 获取对应`key`的`session`

| 参数名 | 参数类型 | 是否必传 |参数描述 |
| --- | --- | --- | --- |
| key | <code>string</code> | 必传 | 键值 |

**返回值类型**： <code>any</code>
### set

**描述**： 设置`sessionStorage` (可存对象)

| 参数名 | 参数类型 | 是否必传 |参数描述 |
| --- | --- | --- | --- |
| key | <code>string</code> | 必传 | 键值 |
| dataSource | <code>any</code> | 必传 | 数据 |
| second | <code>number</code> | 非必传 | 过期时间(s) |

**返回值类型**： <code>any</code>
### remove

**描述**： 移除对应`key`的`session`

| 参数名 | 参数类型 | 是否必传 |参数描述 |
| --- | --- | --- | --- |
| key | <code>string</code> | 必传 | 键值 |
### clear

**描述**： 清空`sessionStorage`

### key

**描述**： 获取`sessionStorage`中第`n+1`个的`key`

| 参数名 | 参数类型 | 是否必传 |参数描述 |
| --- | --- | --- | --- |
| n | <code>number</code> | 必传 | 暂无描述 |

**返回值类型**： <code>string</code>

package com.shop.common;

public class OsResult extends BaseResult {

	private static final long serialVersionUID = 1L;
	/*Java是面向对象的语言，与其他语言进行交互（比如与前端js进行http通信），需要把对象转化成一种通用的格式比如json（前端显然不认识Java对象）
	从对象到json字符串的转换，就是序列化的过程
	反过来，从json字符串转换成Java对象，就是反序列化的过程。

	*serialVersionUID就是用来验证输入的json字符串是否是从当前的Request这个类序列化过去的,
	*当序列化的时候的serialVersionUID与反序列化的时候的serialVersionUID不一致的时候，会跑出InvalidCalssException。 
	*/

	public OsResult(ReturnCode returnCode) {
        super(returnCode.getCode(), returnCode.getMessage());
	}
	
	public OsResult(ReturnCode returnCode, Object data) {
		super(returnCode.getCode(), returnCode.getMessage(), data);
	}
	
	public OsResult(Integer code, String message) {
		super(code, message);
	}
}

/// 订阅者回调签名
typedef void EventCallback(arg);

class EventBus {
  /// 私有构造函数
  EventBus._internal();

  /// 保存单例
  static EventBus _singleton = EventBus._internal();

  /// 工厂构造函数
  factory EventBus() => _singleton;

  /// 保存事件订阅者队列，key:事件名(id)，value: 对应事件的订阅者队列
  var _emap = Map<Object, List<EventCallback>>();

  /// 添加订阅者
  void on(eventName, EventCallback f) {
    if (eventName == null || f == null) return;
    _emap[eventName] ??= <EventCallback>[];
    _emap[eventName]?.add(f);
  }

  /// 移除订阅者
  void off(eventName, [EventCallback? f]) {
    var list = _emap[eventName];
    if (eventName == null || list == null) return;
    if (f == null) {
      _emap[eventName] = <EventCallback>[];
    } else {
      list.remove(f);
    }
  }

  /// 触发事件，事件触发后该事件所有订阅者会被调用
  void emit(eventName, [arg]) {
    var list = _emap[eventName];
    if (list == null) return;
    int len = list.length - 1;

    /// 反向遍历，防止订阅者在回调中移除自身带来的下标错位
    for (var i = len; i > -1; --i) {
      try {
        list[i](arg);
      } catch (e) {}
    }
  }
}

class EventBusMap {
  /// 需要重新登陆刷新 abo 事件
  static final String NEED_RELOGIN = "need_relogin";

  /// 登出事件
  static final String LOGOUT = "logout";


  /// 展示登录弹框
  static final String OPEN_LOGIN_PAGE = "open_login_page";

  /// 登陆成功
  static final String LOGINSUCCESS = "loginSuccess";

  ///取消正在显示的升级框
  static final String CANCEL_SHOWING_UPGRADE_DIALOG =
      "cancel_showing_upgrade_dialog";

  static final String REFRESH_AUTHORITY = "refresh_authority";

  //大字版开关字段
  static var LARGE_WORD_STATE_CHANGE = "large_word_state";

  //全选内容下载
  static final String CONTENT_SELECT_ALL_DELETE_DATA =
      "content_select_all_delete_data";

  //删除内容成功
  static final String CONTENT_DELETE_SUCCESS = "content_delete_success";

  //内容播放
  static final String CONTENT_PLAY = "content_play";

  ///音频播放器显示和隐藏
  static final String SHOW_AND_HIDE_AUDIO = "show_and_hide_audio";

  ///音频暂停or播放
  static final String TOGGLE_AUDIO = "toggle_audio";

  ///关闭音频播放器
  static final String CLOSE_AUDIO = "close_audio";

  ///音频播放,继续当前进度按播放
  static final String PLAY_TIME = "play_time";

  ///完成播放
  static final String AUDIO_COMPLETED = "audio_completed";

  ///关闭音频播放器
  static final String CLOSE_AUDIO_PLAY = "close_audio_play";

  ///音频播放器播放
  static final String AUDIO_PLAYING = "audio_playing";

  ///音频播放器暂停
  static final String AUDIO_PAUSED = "audio_paused";

  ///音频播放器停止
  static final String AUDIO_STOPPED = "audio_stopped";

  //海外用户登录弹框提醒
  static final String OVERSEAS_USER = "overseas_user";

  //音频播放的内容
  static final String AUDIO_PLAYING_CONTENT = "audio_playing_content";

  //推荐管理
  static const String SP_KEY_RECOMMENT_MANAGEMENT = "recommended_management";

  //修改推荐管理的时候刷新页面
  static const String SP_KEY_RECOMMENT_MANAGEMENT_CHANGE =
      "recommended_management_change";

  //刷新大字版首页
  static const String REFRESH_LARGE_HOME = "refresh_large_home";
  //刷新内容工具
  static const String REFRESH_CONTENT_TOOL = "refresh_content_tool";
  //修改内容tab
  static const String CHANGE_CONTENT_TAB = "change_content_tab";
  static const String EXTERNAL_LINK_JUMP = "external_link_jump";

  ///刷新事业菜单待访问tip
  static const String REFRESH_CAREER_HOME_TIPS = "refresh_career_home_tips";

  //切换首页时，需要关闭其它页面
  static var CONTENT_CLOSE_EDIT = "cotent_close_edit";

  //点击编辑页发出的通知
  static var CLICK_EDIT_BUTTOM = "click_edit_bottom";

  //内容详情收藏操作 通知 收藏列表
  static var CONTENT_COLLECT_ACTION = "content_collect_action";

  //内容详情 调用接口 501 无效数据/下架数据
  static var CONTENT_501_NO_DATA = "content_501_no_data";

  ///控制刷新的状态
  static var REFRESH_MESSAGE_LIMITE_STATE = "refresh_message_limit_state";

  ///刷新内容
  static final String REFRESH_CONTENT_DATA = "refresh_content_data";

  ///
  static final String SEARCH_CONTENT_BACK = "search_content_back";

  ///用于刷新设置
  static final String REFRESH_MINE_SETTING = "refresh_setting";

  ///通知锚点位置更新
  static final String REFRESH_MULTILAYER_ANCHOR_PIECE = "refresh_multilayer_anchor_piece";
  ///通知展开收起组件默认值改为false
  static final String REFRESH_EXPAND_FALSE = "refresh_expand_false";
  ///刷新播放清单列表
  static final String REFRESH_PLAYLIST = "refresh_playlist";

  /// 跳转到事业首页
  static final String JUMP_TO_CAREER = "jump_to_career";

  ///发送最新的顾客状态
  static var REFRESH_CUSTOMER_STATE = "refresh_customer_state";

  ///发送最新的顾客状态
  static var JUMP_TO_DAY_SIGN_SHARE = "jump_to_day_sign_share";

}

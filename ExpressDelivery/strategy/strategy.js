/**
 * Created by Administrator on 2017/5/10.
 */
layui.use(['layer'],function () {

    var $ = layui.jquery, layer = layui.layer;

        $(function () {
            var tab=$("#strategy_table");
            var t = "<table grid-manager='strategy_table'></table>";
            tab.empty();
            tab.append(t);
            var table = document.querySelector('table[grid-manager="strategy_table"]');
            table.GM({
                i18n: 'zh-cn'
                , textConfig: {
                    'page-go': {
                        'zh-cn': '跳转',
                        'en-us': 'Go '
                    }
                }
                , disableOrder: false
                , supportSorting: true
                , isCombSorting: true
                , supportDrag: true
                , supportConfig: true
                , supportCheckbox: false//禁用全选
                , supportAjaxPage: true//是否支持分页?true:false
                , ajax_url: '/strategy/index'
                , ajax_type: 'GET'
                , disableCache: true
                , query: {}
                , sizeData: [7, 10, 15, 20, 25]//设置每页显示多少条数据(只允许是整数)
                , pageSize: 7//配置初始进入时每页的显示条数，需要与sizeData中的值匹配。需要注意的是，在启用本地缓存的情况下，每页的显示数为上次用户调整后的数值。
                , columnData: [
                    {
                        key: 'sid',
                        text: '策略编号'
                    }, {
                        key: 'svalues',
                        text: '策略内容'
                    }, {
                        key: 'suid',
                        text: '下发用户',
                        template: function(suid, rowObject){
                            //operation:当前key所对应的单条数据；rowObject：单个一行完整数据
                            return suid.name;
                        }
                    }, {
                        key: 'stime',
                        text: '下发时间'
                    }, {
                        key: 'sstatus',
                        text: '状况',
                        template:function (sstatus,rowObject) {
                            return sstatus==0?"未执行":sstatus==1?"失败":"成功";
                        }
                    }
                ]
            });
        });

    $("#strategy_btn_add").click(function () {
        var values=$("#strategy_input_ip").val();
        if(values!=null||values!=""){
            var forms=$("form[name='strategyForm']");
        }


    })

    $("#strategy_select_head").change(function () {
            var s=$("#strategy_select_foot");
            var h=$("#strategy_select_head").val();
            var sHtml="<option value='8' selected='selected'>主机</option><option value='9'>网站</option>";
            var sHtml2="<option value='0' selected='selected'>Intensescan</option> <option value='1'>IntensescanplusUDP</option> <option value='2'>IntensescanallTCPports</option> <option value='3'>Intensescannoping</option> <option value='4'>Pingscan</option> <option value='5'>Regularscan</option> <option value='6'>Quickscan</option> <option value='7'>Quicktraceroute</option>";
            s.empty();
            if(h==0||h=='0'){
                s.append(sHtml2);
            }else {
                s.append(sHtml);
            }
    });

});
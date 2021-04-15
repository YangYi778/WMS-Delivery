<template>
  <div class="app-container home">
    <section class="el-container">
      <main class="el-main" style="width: 70%">
        <div>
          <div class="classHeader">
            <div class="title-icon"></div>
            <span class="classTitile">待办事项</span>
          </div>
          <div style="margin-top: 20px">
            <el-row :gutter="20">
              <div class="item-col el-row">
                <el-col :span="4">
                  <div style="text-align: center">
                    <span class="itemTitle">待受理订单</span>
                    <br/>
                    <span class="dataNum" >{{ indexInfo.waitOkOrder }}</span>
                  </div>
                </el-col>
                <el-col :span="4">
                  <div style="text-align: center">
                    <span class="itemTitle">待分配订单</span>
                    <br/>
                    <span class="dataNum" >{{ indexInfo.waitAssignOrder }}</span>
                  </div>
                </el-col>
                <el-col :span="4">
                  <div style="text-align: center">
                    <span class="itemTitle">待拣货订单</span>
                    <br/>
                    <span class="dataNum">{{ indexInfo.waitPickingOrder }}</span>
                  </div>
                </el-col>
                <el-col :span="4">
                  <div style="text-align: center">
                    <span class="itemTitle">待复核订单</span>
                    <br/>
                    <span class="dataNum">{{ indexInfo.waitCheckOrder }}</span>
                  </div>
                </el-col>
                <el-col :span="4">
                  <div style="text-align: center">
                    <span class="itemTitle">待打包订单</span>
                    <br/>
                    <span class="dataNum">{{ indexInfo.waitPackageOrder }}</span>
                  </div>
                </el-col>
                <el-col :span="4">
                  <div style="text-align: center">
                    <span class="itemTitle">待发货订单</span>
                    <br/>
                    <span class="dataNum">{{ indexInfo.waitSendOrder }}</span>
                  </div>
                </el-col>
              </div>
            </el-row>
          </div>
        </div>
        <div style="margin-top: 20px">
          <div class="classHeader">
            <div class="title-icon"></div>
            <span class="classTitile">库存信息</span>
          </div>
          <div style="margin-top: 20px">
            <el-row :gutter="20">
              <div class="el-row item-col">
                <el-col :span="8">
                  <div style="text-align: center">
                    <span class="itemTitle">库存商品种类</span>
                    <br/>
                    <span class="dataNum">{{ indexInfo.stockGoodType }}</span>
                  </div>
                </el-col>
                <el-col :span="8">
                  <div style="text-align: center">
                    <span class="itemTitle">出库商品数</span>
                    <br/>
                    <span class="dataNum">{{ indexInfo.outboundGoodQty }}</span>
                  </div>
                </el-col>
                <el-col :span="8">
                  <div style="text-align: center">
                    <span class="itemTitle">临期产品数</span>
                    <br/>
                    <span class="dataNum">{{ indexInfo.expiryGoodQty }}</span>
                  </div>
                </el-col>
              </div>
            </el-row>
          </div>
        </div>
        <div style="margin-top: 20px">
          <div class="classHeader">
            <div class="title-icon"></div>
            <span class="classTitile">订单统计</span>
          </div>
          <div style="margin-top: 20px" >
            <el-row :gutter="20">
              <el-col :span="6" align="right" type="flex">
                <div>
                  <el-col :span="12">
                    <img :src="newInnerOrderIcon" width="80px" height="80px" />
                  </el-col>
                </div>
                <div style="margin-top: 20px">
                  <el-col :span="12" style="text-align: center">
                    <div >
                      <span>入库新增</span>
                      <br/>
                      <span class="dataNum">{{ indexInfo.newInnerOrder }}</span>
                    </div>
                  </el-col>
                </div>
              </el-col>
              <el-col :span="6" align="right" type="flex">
                <div>
                  <el-col :span="12">
                    <img :src="finInnerOrderIcon" width="80px" height="80px" />
                  </el-col>
                </div>
                <div style="margin-top: 20px">
                  <el-col :span="12" style="text-align: center">
                    <div >
                      <span>入库完成</span>
                      <br/>
                      <span class="dataNum">{{ indexInfo.finInnerOrder }}</span>
                    </div>
                  </el-col>
                </div>
              </el-col>
              <el-col :span="6" align="right" type="flex">
                <div>
                  <el-col :span="12">
                    <img :src="newOutboundOrderIcon" width="80px" height="80px" />
                  </el-col>
                </div>
                <div style="margin-top: 20px">
                  <el-col :span="12" style="text-align: center">
                    <div >
                      <span>出库新增</span>
                      <br/>
                      <span class="dataNum">{{ indexInfo.newOutboundOrder }}</span>
                    </div>
                  </el-col>
                </div>
              </el-col>
              <el-col :span="6" align="right" type="flex">
                <div>
                  <el-col :span="12">
                    <img :src="finOutboundOrderIcon" width="80px" height="80px" />
                  </el-col>
                </div>
                <div style="margin-top: 20px">
                  <el-col :span="12" style="text-align: center">
                    <div >
                      <span>出库完成</span>
                      <br/>
                      <span class="dataNum">{{ indexInfo.finOutboundOrder }}</span>
                    </div>
                  </el-col>
                </div>
              </el-col>
            </el-row>
          </div>
        </div>
        <div style="margin-top: 20px">
          <div class="classHeader">
            <div class="title-icon"></div>
            <span class="classTitile">数据可视化</span>
          </div>
          <div style="margin-top: 20px">
            <el-row>
              <el-col :span="12">
                <div>
                  <img :src="testImg" height="360px" width="550px"/>
                </div>
              </el-col>
              <el-col :span="12">
                <div>
                  <img :src="testImg" height="360px" width="550px" />
                </div>
              </el-col>
            </el-row>
            <!--            <el-row>-->
            <!--              <el-col :span="12">-->
            <!--                <div>-->
            <!--                  <img :src="testImg" height="360px" width="550px" />-->
            <!--                </div>-->
            <!--              </el-col>-->
            <!--              <el-col :span="12">-->
            <!--                <div>-->
            <!--                  <img :src="testImg" height="360px" width="550px"/>-->
            <!--                </div>-->
            <!--              </el-col>-->
            <!--            </el-row>-->
          </div>
        </div>
      </main>


      <aside class="el-aside" style="width:30%">
        <div class="classHeader">
          <div class="title-icon"></div>
          <span class="classTitile">待添加模块</span>
        </div>
      </aside>
    </section>

  </div>
</template>

<script>
  import testImg from '@/assets/test/test.jpg';
  import newInnerOrderIcon from '@/assets/order_show/newInnerOrder.png';
  import finInnerOrderIcon from '@/assets/order_show/finInnerOrder.png';
  import newOutboundOrderIcon from '@/assets/order_show/newOutboundOrder.png';
  import finOutboundOrderIcon from '@/assets/order_show/finOutboundOrder.png';
  import {getIndexInfo } from "@/api/system/index";

  export default {
  name: "index",
  data() {
    return {
      testImg: testImg,
      newInnerOrderIcon: newInnerOrderIcon,
      finInnerOrderIcon: finInnerOrderIcon,
      newOutboundOrderIcon: newOutboundOrderIcon,
      finOutboundOrderIcon: finOutboundOrderIcon,
      // 版本号
      version: "3.3.0",
      //主页数据集合
      indexInfo: {
        waitOkOrder: null,
        waitAssignOrder: null,
        waitPickingOrder: null,
        waitCheckOrder: null,
        waitPackageOrder: null,
        waitSendOrder: null,
        stockGoodType: null,
        outboundGoodQty: null,
        expiryGoodQty: null,
        newInnerOrder: null,
        finInnerOrder: null,
        newOutboundOrder: null,
        finOutboundOrder: null
      },
      day: 30
    };
  },
  created() {
    this.updateIndexInfo(this.day);
  },
  methods: {
    goTarget(href) {
      window.open(href, "_blank");
    },
    updateIndexInfo(day){
      this.loading = true;
      getIndexInfo(day).then(response => {
        console.info(response);
        this.indexInfo = response.data;
        this.loading = false;
      });
    }
  },
};
</script>

<style scoped lang="scss">
.home {
  blockquote {
    padding: 10px 20px;
    margin: 0 0 20px;
    font-size: 17.5px;
    border-left: 5px solid #eee;
  }
  hr {
    margin-top: 20px;
    margin-bottom: 20px;
    border: 0;
    border-top: 1px solid #eee;
  }
  .col-item {
    margin-bottom: 20px;
  }

  ul {
    padding: 0;
    margin: 0;
  }

  font-family: "open sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
  font-size: 13px;
  color: #676a6c;
  overflow-x: hidden;

  ul {
    list-style-type: none;
  }

  h4 {
    margin-top: 0px;
  }

  h2 {
    margin-top: 10px;
    font-size: 26px;
    font-weight: 100;
  }

  p {
    margin-top: 10px;

    b {
      font-weight: 700;
    }
  }

  .update-log {
    ol {
      display: block;
      list-style-type: decimal;
      margin-block-start: 1em;
      margin-block-end: 1em;
      margin-inline-start: 0;
      margin-inline-end: 0;
      padding-inline-start: 40px;
    }
  }

}
.itemTitle {
  height: 30px;
  line-height: 30px;
  font-size: 14px;
  color: #0a1613;
  font-weight: 700;
  text-align: center;
}
.dataNum {
  font-size: 32px;
  line-height: 40px;
  font-weight: 700;
  cursor: pointer;
}
.classTitile {
  line-height: 28px;
  margin-right: 20px;
  font-weight: bold;
}
  .title-icon{
    width: 4px;
    height: 16px;
    background-color: #2eceb9;
    vertical-align: middle;
    display: inline-block;
    margin-top: 7px;
    margin-left: 10px;
  }
  .classHeader{
    display: flex;
    font-size: 16px;
    color: #0a161e;
  }
  .item-col{
    margin-left: -10px;
    margin-right: -10px;
    padding: 10px 0px;
    box-sizing: border-box;
  }
</style>


package com.asset.examine.domain;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.List;
/**
*
*  @author author
*/
public class SxExamineLog implements Serializable {

    private static final long serialVersionUID = 1613348921210L;


    /**
    * 主键
    * 主键
    * isNullAble:0
    */
    private Integer id;

    /**
    * 申请人id
    * isNullAble:1
    */
    private Integer codeId;

    /**
    * 申请类型 1:注册，2:入会，3项目发起申请，4:承销流程
    * isNullAble:1
    */
    private Integer type;

    /**
    * 审核人id
    * isNullAble:1
    */
    private Integer examineId;

    /**
    * 审核结果 0:审核中，1:通过，2:不通过
    * isNullAble:1
    */
    private Integer resultType;

    /**
    * 审核结果内容
    * isNullAble:1
    */
    private String resultContent;

    /**
    * 申请时间
    * isNullAble:1
    */
    private java.time.LocalDateTime createTime;


    private String openid;

    private String appid;

    public String getOpenid() {
        return openid;
    }

    public void setOpenid(String openid) {
        this.openid = openid;
    }

    public String getAppid() {
        return appid;
    }

    public void setAppid(String appid) {
        this.appid = appid;
    }

    public void setId(Integer id){this.id = id;}

    public Integer getId(){return this.id;}

    public void setCodeId(Integer codeId){this.codeId = codeId;}

    public Integer getCodeId(){return this.codeId;}

    public void setType(Integer type){this.type = type;}

    public Integer getType(){return this.type;}

    public void setExamineId(Integer examineId){this.examineId = examineId;}

    public Integer getExamineId(){return this.examineId;}

    public void setResultType(Integer resultType){this.resultType = resultType;}

    public Integer getResultType(){return this.resultType;}

    public void setResultContent(String resultContent){this.resultContent = resultContent;}

    public String getResultContent(){return this.resultContent;}

    public void setCreateTime(java.time.LocalDateTime createTime){this.createTime = createTime;}

    public java.time.LocalDateTime getCreateTime(){return this.createTime;}
    @Override
    public String toString() {
        return "SxExamineLog{" +
                "id='" + id + '\'' +
                "codeId='" + codeId + '\'' +
                "type='" + type + '\'' +
                "examineId='" + examineId + '\'' +
                "resultType='" + resultType + '\'' +
                "resultContent='" + resultContent + '\'' +
                "createTime='" + createTime + '\'' +
            '}';
    }

    public static Builder Build(){return new Builder();}

    public static ConditionBuilder ConditionBuild(){return new ConditionBuilder();}

    public static UpdateBuilder UpdateBuild(){return new UpdateBuilder();}

    public static QueryBuilder QueryBuild(){return new QueryBuilder();}

    public static class UpdateBuilder {

        private SxExamineLog set;

        private ConditionBuilder where;

        public UpdateBuilder set(SxExamineLog set){
            this.set = set;
            return this;
        }

        public SxExamineLog getSet(){
            return this.set;
        }

        public UpdateBuilder where(ConditionBuilder where){
            this.where = where;
            return this;
        }

        public ConditionBuilder getWhere(){
            return this.where;
        }

        public UpdateBuilder build(){
            return this;
        }
    }

    public static class QueryBuilder extends SxExamineLog{
        /**
        * 需要返回的列
        */
        private Map<String,Object> fetchFields;

        public Map<String,Object> getFetchFields(){return this.fetchFields;}

        private List<Integer> idList;

        public List<Integer> getIdList(){return this.idList;}

        private Integer idSt;

        private Integer idEd;

        public Integer getIdSt(){return this.idSt;}

        public Integer getIdEd(){return this.idEd;}

        private List<Integer> codeIdList;

        public List<Integer> getCodeIdList(){return this.codeIdList;}

        private Integer codeIdSt;

        private Integer codeIdEd;

        public Integer getCodeIdSt(){return this.codeIdSt;}

        public Integer getCodeIdEd(){return this.codeIdEd;}

        private List<Integer> typeList;

        public List<Integer> getTypeList(){return this.typeList;}

        private Integer typeSt;

        private Integer typeEd;

        public Integer getTypeSt(){return this.typeSt;}

        public Integer getTypeEd(){return this.typeEd;}

        private List<Integer> examineIdList;

        public List<Integer> getExamineIdList(){return this.examineIdList;}

        private Integer examineIdSt;

        private Integer examineIdEd;

        public Integer getExamineIdSt(){return this.examineIdSt;}

        public Integer getExamineIdEd(){return this.examineIdEd;}

        private List<Integer> resultTypeList;

        public List<Integer> getResultTypeList(){return this.resultTypeList;}

        private Integer resultTypeSt;

        private Integer resultTypeEd;

        public Integer getResultTypeSt(){return this.resultTypeSt;}

        public Integer getResultTypeEd(){return this.resultTypeEd;}

        private List<String> resultContentList;

        public List<String> getResultContentList(){return this.resultContentList;}


        private List<String> fuzzyResultContent;

        public List<String> getFuzzyResultContent(){return this.fuzzyResultContent;}

        private List<String> rightFuzzyResultContent;

        public List<String> getRightFuzzyResultContent(){return this.rightFuzzyResultContent;}
        private List<java.time.LocalDateTime> createTimeList;

        public List<java.time.LocalDateTime> getCreateTimeList(){return this.createTimeList;}

        private java.time.LocalDateTime createTimeSt;

        private java.time.LocalDateTime createTimeEd;

        public java.time.LocalDateTime getCreateTimeSt(){return this.createTimeSt;}

        public java.time.LocalDateTime getCreateTimeEd(){return this.createTimeEd;}

        private QueryBuilder (){
            this.fetchFields = new HashMap<>();
        }

        public QueryBuilder idBetWeen(Integer idSt,Integer idEd){
            this.idSt = idSt;
            this.idEd = idEd;
            return this;
        }

        public QueryBuilder idGreaterEqThan(Integer idSt){
            this.idSt = idSt;
            return this;
        }
        public QueryBuilder idLessEqThan(Integer idEd){
            this.idEd = idEd;
            return this;
        }


        public QueryBuilder id(Integer id){
            setId(id);
            return this;
        }

        public QueryBuilder idList(Integer ... id){
            this.idList = solveNullList(id);
            return this;
        }

        public QueryBuilder idList(List<Integer> id){
            this.idList = id;
            return this;
        }

        public QueryBuilder fetchId(){
            setFetchFields("fetchFields","id");
            return this;
        }

        public QueryBuilder excludeId(){
            setFetchFields("excludeFields","id");
            return this;
        }

        public QueryBuilder codeIdBetWeen(Integer codeIdSt,Integer codeIdEd){
            this.codeIdSt = codeIdSt;
            this.codeIdEd = codeIdEd;
            return this;
        }

        public QueryBuilder codeIdGreaterEqThan(Integer codeIdSt){
            this.codeIdSt = codeIdSt;
            return this;
        }
        public QueryBuilder codeIdLessEqThan(Integer codeIdEd){
            this.codeIdEd = codeIdEd;
            return this;
        }


        public QueryBuilder codeId(Integer codeId){
            setCodeId(codeId);
            return this;
        }

        public QueryBuilder codeIdList(Integer ... codeId){
            this.codeIdList = solveNullList(codeId);
            return this;
        }

        public QueryBuilder codeIdList(List<Integer> codeId){
            this.codeIdList = codeId;
            return this;
        }

        public QueryBuilder fetchCodeId(){
            setFetchFields("fetchFields","codeId");
            return this;
        }

        public QueryBuilder excludeCodeId(){
            setFetchFields("excludeFields","codeId");
            return this;
        }

        public QueryBuilder typeBetWeen(Integer typeSt,Integer typeEd){
            this.typeSt = typeSt;
            this.typeEd = typeEd;
            return this;
        }

        public QueryBuilder typeGreaterEqThan(Integer typeSt){
            this.typeSt = typeSt;
            return this;
        }
        public QueryBuilder typeLessEqThan(Integer typeEd){
            this.typeEd = typeEd;
            return this;
        }


        public QueryBuilder type(Integer type){
            setType(type);
            return this;
        }

        public QueryBuilder typeList(Integer ... type){
            this.typeList = solveNullList(type);
            return this;
        }

        public QueryBuilder typeList(List<Integer> type){
            this.typeList = type;
            return this;
        }

        public QueryBuilder fetchType(){
            setFetchFields("fetchFields","type");
            return this;
        }

        public QueryBuilder excludeType(){
            setFetchFields("excludeFields","type");
            return this;
        }

        public QueryBuilder examineIdBetWeen(Integer examineIdSt,Integer examineIdEd){
            this.examineIdSt = examineIdSt;
            this.examineIdEd = examineIdEd;
            return this;
        }

        public QueryBuilder examineIdGreaterEqThan(Integer examineIdSt){
            this.examineIdSt = examineIdSt;
            return this;
        }
        public QueryBuilder examineIdLessEqThan(Integer examineIdEd){
            this.examineIdEd = examineIdEd;
            return this;
        }


        public QueryBuilder examineId(Integer examineId){
            setExamineId(examineId);
            return this;
        }

        public QueryBuilder examineIdList(Integer ... examineId){
            this.examineIdList = solveNullList(examineId);
            return this;
        }

        public QueryBuilder examineIdList(List<Integer> examineId){
            this.examineIdList = examineId;
            return this;
        }

        public QueryBuilder fetchExamineId(){
            setFetchFields("fetchFields","examineId");
            return this;
        }

        public QueryBuilder excludeExamineId(){
            setFetchFields("excludeFields","examineId");
            return this;
        }

        public QueryBuilder resultTypeBetWeen(Integer resultTypeSt,Integer resultTypeEd){
            this.resultTypeSt = resultTypeSt;
            this.resultTypeEd = resultTypeEd;
            return this;
        }

        public QueryBuilder resultTypeGreaterEqThan(Integer resultTypeSt){
            this.resultTypeSt = resultTypeSt;
            return this;
        }
        public QueryBuilder resultTypeLessEqThan(Integer resultTypeEd){
            this.resultTypeEd = resultTypeEd;
            return this;
        }


        public QueryBuilder resultType(Integer resultType){
            setResultType(resultType);
            return this;
        }

        public QueryBuilder resultTypeList(Integer ... resultType){
            this.resultTypeList = solveNullList(resultType);
            return this;
        }

        public QueryBuilder resultTypeList(List<Integer> resultType){
            this.resultTypeList = resultType;
            return this;
        }

        public QueryBuilder fetchResultType(){
            setFetchFields("fetchFields","resultType");
            return this;
        }

        public QueryBuilder excludeResultType(){
            setFetchFields("excludeFields","resultType");
            return this;
        }

        public QueryBuilder fuzzyResultContent (List<String> fuzzyResultContent){
            this.fuzzyResultContent = fuzzyResultContent;
            return this;
        }

        public QueryBuilder fuzzyResultContent (String ... fuzzyResultContent){
            this.fuzzyResultContent = solveNullList(fuzzyResultContent);
            return this;
        }

        public QueryBuilder rightFuzzyResultContent (List<String> rightFuzzyResultContent){
            this.rightFuzzyResultContent = rightFuzzyResultContent;
            return this;
        }

        public QueryBuilder rightFuzzyResultContent (String ... rightFuzzyResultContent){
            this.rightFuzzyResultContent = solveNullList(rightFuzzyResultContent);
            return this;
        }

        public QueryBuilder resultContent(String resultContent){
            setResultContent(resultContent);
            return this;
        }

        public QueryBuilder resultContentList(String ... resultContent){
            this.resultContentList = solveNullList(resultContent);
            return this;
        }

        public QueryBuilder resultContentList(List<String> resultContent){
            this.resultContentList = resultContent;
            return this;
        }

        public QueryBuilder fetchResultContent(){
            setFetchFields("fetchFields","resultContent");
            return this;
        }

        public QueryBuilder excludeResultContent(){
            setFetchFields("excludeFields","resultContent");
            return this;
        }

        public QueryBuilder createTimeBetWeen(java.time.LocalDateTime createTimeSt,java.time.LocalDateTime createTimeEd){
            this.createTimeSt = createTimeSt;
            this.createTimeEd = createTimeEd;
            return this;
        }

        public QueryBuilder createTimeGreaterEqThan(java.time.LocalDateTime createTimeSt){
            this.createTimeSt = createTimeSt;
            return this;
        }
        public QueryBuilder createTimeLessEqThan(java.time.LocalDateTime createTimeEd){
            this.createTimeEd = createTimeEd;
            return this;
        }


        public QueryBuilder createTime(java.time.LocalDateTime createTime){
            setCreateTime(createTime);
            return this;
        }

        public QueryBuilder createTimeList(java.time.LocalDateTime ... createTime){
            this.createTimeList = solveNullList(createTime);
            return this;
        }

        public QueryBuilder createTimeList(List<java.time.LocalDateTime> createTime){
            this.createTimeList = createTime;
            return this;
        }

        public QueryBuilder fetchCreateTime(){
            setFetchFields("fetchFields","createTime");
            return this;
        }

        public QueryBuilder excludeCreateTime(){
            setFetchFields("excludeFields","createTime");
            return this;
        }
        private <T>List<T> solveNullList(T ... objs){
            if (objs != null){
            List<T> list = new ArrayList<>();
                for (T item : objs){
                    if (item != null){
                        list.add(item);
                    }
                }
                return list;
            }
            return null;
        }

        public QueryBuilder fetchAll(){
            this.fetchFields.put("AllFields",true);
            return this;
        }

        public QueryBuilder addField(String ... fields){
            List<String> list = new ArrayList<>();
            if (fields != null){
                for (String field : fields){
                    list.add(field);
                }
            }
            this.fetchFields.put("otherFields",list);
            return this;
        }
        @SuppressWarnings("unchecked")
        private void setFetchFields(String key,String val){
            Map<String,Boolean> fields= (Map<String, Boolean>) this.fetchFields.get(key);
            if (fields == null){
                fields = new HashMap<>();
            }
            fields.put(val,true);
            this.fetchFields.put(key,fields);
        }

        public SxExamineLog build(){return this;}
    }


    public static class ConditionBuilder{
        private List<Integer> idList;

        public List<Integer> getIdList(){return this.idList;}

        private Integer idSt;

        private Integer idEd;

        public Integer getIdSt(){return this.idSt;}

        public Integer getIdEd(){return this.idEd;}

        private List<Integer> codeIdList;

        public List<Integer> getCodeIdList(){return this.codeIdList;}

        private Integer codeIdSt;

        private Integer codeIdEd;

        public Integer getCodeIdSt(){return this.codeIdSt;}

        public Integer getCodeIdEd(){return this.codeIdEd;}

        private List<Integer> typeList;

        public List<Integer> getTypeList(){return this.typeList;}

        private Integer typeSt;

        private Integer typeEd;

        public Integer getTypeSt(){return this.typeSt;}

        public Integer getTypeEd(){return this.typeEd;}

        private List<Integer> examineIdList;

        public List<Integer> getExamineIdList(){return this.examineIdList;}

        private Integer examineIdSt;

        private Integer examineIdEd;

        public Integer getExamineIdSt(){return this.examineIdSt;}

        public Integer getExamineIdEd(){return this.examineIdEd;}

        private List<Integer> resultTypeList;

        public List<Integer> getResultTypeList(){return this.resultTypeList;}

        private Integer resultTypeSt;

        private Integer resultTypeEd;

        public Integer getResultTypeSt(){return this.resultTypeSt;}

        public Integer getResultTypeEd(){return this.resultTypeEd;}

        private List<String> resultContentList;

        public List<String> getResultContentList(){return this.resultContentList;}


        private List<String> fuzzyResultContent;

        public List<String> getFuzzyResultContent(){return this.fuzzyResultContent;}

        private List<String> rightFuzzyResultContent;

        public List<String> getRightFuzzyResultContent(){return this.rightFuzzyResultContent;}
        private List<java.time.LocalDateTime> createTimeList;

        public List<java.time.LocalDateTime> getCreateTimeList(){return this.createTimeList;}

        private java.time.LocalDateTime createTimeSt;

        private java.time.LocalDateTime createTimeEd;

        public java.time.LocalDateTime getCreateTimeSt(){return this.createTimeSt;}

        public java.time.LocalDateTime getCreateTimeEd(){return this.createTimeEd;}


        public ConditionBuilder idBetWeen(Integer idSt,Integer idEd){
            this.idSt = idSt;
            this.idEd = idEd;
            return this;
        }

        public ConditionBuilder idGreaterEqThan(Integer idSt){
            this.idSt = idSt;
            return this;
        }
        public ConditionBuilder idLessEqThan(Integer idEd){
            this.idEd = idEd;
            return this;
        }


        public ConditionBuilder idList(Integer ... id){
            this.idList = solveNullList(id);
            return this;
        }

        public ConditionBuilder idList(List<Integer> id){
            this.idList = id;
            return this;
        }

        public ConditionBuilder codeIdBetWeen(Integer codeIdSt,Integer codeIdEd){
            this.codeIdSt = codeIdSt;
            this.codeIdEd = codeIdEd;
            return this;
        }

        public ConditionBuilder codeIdGreaterEqThan(Integer codeIdSt){
            this.codeIdSt = codeIdSt;
            return this;
        }
        public ConditionBuilder codeIdLessEqThan(Integer codeIdEd){
            this.codeIdEd = codeIdEd;
            return this;
        }


        public ConditionBuilder codeIdList(Integer ... codeId){
            this.codeIdList = solveNullList(codeId);
            return this;
        }

        public ConditionBuilder codeIdList(List<Integer> codeId){
            this.codeIdList = codeId;
            return this;
        }

        public ConditionBuilder typeBetWeen(Integer typeSt,Integer typeEd){
            this.typeSt = typeSt;
            this.typeEd = typeEd;
            return this;
        }

        public ConditionBuilder typeGreaterEqThan(Integer typeSt){
            this.typeSt = typeSt;
            return this;
        }
        public ConditionBuilder typeLessEqThan(Integer typeEd){
            this.typeEd = typeEd;
            return this;
        }


        public ConditionBuilder typeList(Integer ... type){
            this.typeList = solveNullList(type);
            return this;
        }

        public ConditionBuilder typeList(List<Integer> type){
            this.typeList = type;
            return this;
        }

        public ConditionBuilder examineIdBetWeen(Integer examineIdSt,Integer examineIdEd){
            this.examineIdSt = examineIdSt;
            this.examineIdEd = examineIdEd;
            return this;
        }

        public ConditionBuilder examineIdGreaterEqThan(Integer examineIdSt){
            this.examineIdSt = examineIdSt;
            return this;
        }
        public ConditionBuilder examineIdLessEqThan(Integer examineIdEd){
            this.examineIdEd = examineIdEd;
            return this;
        }


        public ConditionBuilder examineIdList(Integer ... examineId){
            this.examineIdList = solveNullList(examineId);
            return this;
        }

        public ConditionBuilder examineIdList(List<Integer> examineId){
            this.examineIdList = examineId;
            return this;
        }

        public ConditionBuilder resultTypeBetWeen(Integer resultTypeSt,Integer resultTypeEd){
            this.resultTypeSt = resultTypeSt;
            this.resultTypeEd = resultTypeEd;
            return this;
        }

        public ConditionBuilder resultTypeGreaterEqThan(Integer resultTypeSt){
            this.resultTypeSt = resultTypeSt;
            return this;
        }
        public ConditionBuilder resultTypeLessEqThan(Integer resultTypeEd){
            this.resultTypeEd = resultTypeEd;
            return this;
        }


        public ConditionBuilder resultTypeList(Integer ... resultType){
            this.resultTypeList = solveNullList(resultType);
            return this;
        }

        public ConditionBuilder resultTypeList(List<Integer> resultType){
            this.resultTypeList = resultType;
            return this;
        }

        public ConditionBuilder fuzzyResultContent (List<String> fuzzyResultContent){
            this.fuzzyResultContent = fuzzyResultContent;
            return this;
        }

        public ConditionBuilder fuzzyResultContent (String ... fuzzyResultContent){
            this.fuzzyResultContent = solveNullList(fuzzyResultContent);
            return this;
        }

        public ConditionBuilder rightFuzzyResultContent (List<String> rightFuzzyResultContent){
            this.rightFuzzyResultContent = rightFuzzyResultContent;
            return this;
        }

        public ConditionBuilder rightFuzzyResultContent (String ... rightFuzzyResultContent){
            this.rightFuzzyResultContent = solveNullList(rightFuzzyResultContent);
            return this;
        }

        public ConditionBuilder resultContentList(String ... resultContent){
            this.resultContentList = solveNullList(resultContent);
            return this;
        }

        public ConditionBuilder resultContentList(List<String> resultContent){
            this.resultContentList = resultContent;
            return this;
        }

        public ConditionBuilder createTimeBetWeen(java.time.LocalDateTime createTimeSt,java.time.LocalDateTime createTimeEd){
            this.createTimeSt = createTimeSt;
            this.createTimeEd = createTimeEd;
            return this;
        }

        public ConditionBuilder createTimeGreaterEqThan(java.time.LocalDateTime createTimeSt){
            this.createTimeSt = createTimeSt;
            return this;
        }
        public ConditionBuilder createTimeLessEqThan(java.time.LocalDateTime createTimeEd){
            this.createTimeEd = createTimeEd;
            return this;
        }


        public ConditionBuilder createTimeList(java.time.LocalDateTime ... createTime){
            this.createTimeList = solveNullList(createTime);
            return this;
        }

        public ConditionBuilder createTimeList(List<java.time.LocalDateTime> createTime){
            this.createTimeList = createTime;
            return this;
        }

        private <T>List<T> solveNullList(T ... objs){
            if (objs != null){
            List<T> list = new ArrayList<>();
                for (T item : objs){
                    if (item != null){
                        list.add(item);
                    }
                }
                return list;
            }
            return null;
        }

        public ConditionBuilder build(){return this;}
    }

    public static class Builder {

        private SxExamineLog obj;

        public Builder(){
            this.obj = new SxExamineLog();
        }

        public Builder id(Integer id){
            this.obj.setId(id);
            return this;
        }
        public Builder codeId(Integer codeId){
            this.obj.setCodeId(codeId);
            return this;
        }
        public Builder type(Integer type){
            this.obj.setType(type);
            return this;
        }
        public Builder examineId(Integer examineId){
            this.obj.setExamineId(examineId);
            return this;
        }
        public Builder resultType(Integer resultType){
            this.obj.setResultType(resultType);
            return this;
        }
        public Builder resultContent(String resultContent){
            this.obj.setResultContent(resultContent);
            return this;
        }
        public Builder createTime(java.time.LocalDateTime createTime){
            this.obj.setCreateTime(createTime);
            return this;
        }
        public SxExamineLog build(){return obj;}
    }

}

package packageMapper.base;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import packageModel.SxExamineLog;
/**
*  @author author
*/
public interface SxExamineLogBaseMapper {

    int insertSxExamineLog(SxExamineLog object);

    int updateSxExamineLog(SxExamineLog object);

    int update(SxExamineLog.UpdateBuilder object);

    List<SxExamineLog> querySxExamineLog(SxExamineLog object);

    SxExamineLog querySxExamineLogLimit1(SxExamineLog object);

}
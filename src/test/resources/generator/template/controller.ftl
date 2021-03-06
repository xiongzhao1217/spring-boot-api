package ${basePackage}.web${modulePath};
import ${basePackage}.core.api.Result;
import ${basePackage}.core.api.ResultGenerator;
import ${basePackage}.model${modulePath}.${modelNameUpperCamel};
import ${basePackage}.service${modulePath}.${modelNameUpperCamel}Service;
import ${basePackage}.core.PageBean;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import javax.annotation.Resource;

/**
 * ${modelNameUpperCamel}Controller created on ${date}.
 * @author ${author}.
 */
@RestController
@RequestMapping("/${modulePath ? substring(1)}/${modelNameLowerCamel}")
public class ${modelNameUpperCamel}Controller {
    @Resource
    private ${modelNameUpperCamel}Service ${modelNameLowerCamel}Service;

    @PostMapping("/add")
    public Result add(${modelNameUpperCamel} ${modelNameLowerCamel}) {
        ${modelNameLowerCamel}Service.insertSelective(${modelNameLowerCamel});
        return ResultGenerator.genSuccessResult();
    }

    @PostMapping("/delete")
    public Result delete(@RequestParam Integer id) {
        ${modelNameLowerCamel}Service.deleteById(id);
        return ResultGenerator.genSuccessResult();
    }

    @PostMapping("/update")
    public Result update(${modelNameUpperCamel} ${modelNameLowerCamel}) {
        ${modelNameLowerCamel}Service.updateSelective(${modelNameLowerCamel});
        return ResultGenerator.genSuccessResult();
    }

    @PostMapping("/detail")
    public Result detail(@RequestParam Integer id) {
        ${modelNameUpperCamel} ${modelNameLowerCamel} = ${modelNameLowerCamel}Service.selectById(id);
        return ResultGenerator.genSuccessResult(${modelNameLowerCamel});
    }

    @PostMapping("/list")
    public Result list(PageBean pageBean, ${modelNameUpperCamel} query) {
        PageInfo<${modelNameUpperCamel}> pageInfo = PageHelper.startPage(pageBean)
        .setOrderBy(pageBean.getOrderBy())
        .doSelectPageInfo(()->${modelNameLowerCamel}Service.find(query));
        return ResultGenerator.genSuccessResult(pageInfo);
    }
}

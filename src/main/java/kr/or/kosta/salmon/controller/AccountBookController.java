package kr.or.kosta.salmon.controller;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.kosta.salmon.domain.AccountBookDTO;
import kr.or.kosta.salmon.domain.PsnsDTO;
import kr.or.kosta.salmon.domain.UserDTO;
import kr.or.kosta.salmon.service.AccountBookService;
import kr.or.kosta.salmon.service.SNSService;
import lombok.extern.log4j.Log4j;

/**
 * AccountBookController
 */
@Controller
@RequestMapping("/accountbook")
@Log4j
public class AccountBookController {

    @Inject
    private AccountBookService abs;

    @Inject
    private SNSService snsService;

    @GetMapping(value = "/calendar")
    public void calendar(Principal principal, Model model) {
        log.info("calendar...");
        PsnsDTO psnsDTO = null;
        try {
            psnsDTO = abs.getPsns(principal.getName());
            model.addAttribute("psns", psnsDTO);
            // 로그인한 유저 정보
            UserDTO meDTO = snsService.getSimpleUser(principal.getName());
            model.addAttribute("me", meDTO);
            ObjectMapper objmapper = new ObjectMapper();
            try {
                String meJSON = objmapper.writeValueAsString(meDTO);
                model.addAttribute("meJSON", meJSON);
            } catch (JsonProcessingException e) {
                e.printStackTrace();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @GetMapping(value = "/ggv", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
    public @ResponseBody ResponseEntity<List<AccountBookDTO>> getAccountBooks(@RequestParam("year") String year,
            @RequestParam("month") String month, Principal principal) {
        log.info("calendar get.... " + month);
        int psnStartDay = 1;
        List<AccountBookDTO> abDTOs = null;
        ResponseEntity<List<AccountBookDTO>> rEntity = null;
        int yearTemp = Integer.parseInt(year);
        int monthTemp = Integer.parseInt(month);
        log.info(monthTemp);
        try {
            psnStartDay = abs.getPsnMonthStart(principal.getName());
            if (psnStartDay >= 16 && psnStartDay <= 31) {
                if (monthTemp == 1) {
                    abDTOs = abs.getAccountBooks(principal.getName(), (yearTemp - 1) + "", year, "12", month);
                } else if (monthTemp >= 11) {
                    abDTOs = abs.getAccountBooks(principal.getName(), year, year, "" + (monthTemp - 1), month);
                } else if (monthTemp >= 2 && monthTemp <= 10) {
                    abDTOs = abs.getAccountBooks(principal.getName(), year, year, "0" + (monthTemp - 1), month);
                }
            } else if (psnStartDay >= 1 && psnStartDay <= 15) {
                if (monthTemp == 12) {
                    abDTOs = abs.getAccountBooks(principal.getName(), year, (yearTemp + 1) + "", month, "01");
                } else if (monthTemp >= 9) {
                    abDTOs = abs.getAccountBooks(principal.getName(), year, year, month, "" + (monthTemp + 1));
                } else if (monthTemp >= 1 && monthTemp <= 8) {
                    abDTOs = abs.getAccountBooks(principal.getName(), year, year, month, "0" + (monthTemp + 1));
                }
            }
            rEntity = new ResponseEntity<>(abDTOs, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            rEntity = new ResponseEntity<>(HttpStatus.NOT_FOUND);
            return rEntity;
        }
        return rEntity;
    }

    @GetMapping(value = "/ggv/year/{year}", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
    public @ResponseBody ResponseEntity<Map<String, List<AccountBookDTO>>> getAccountBooksByYear(
            @PathVariable("year") String year, Principal principal) {
        log.info("calendar year get....");
        int psnStartDay = 1;
        Map<String, List<AccountBookDTO>> abDTOs = null;
        ResponseEntity<Map<String, List<AccountBookDTO>>> rEntity = null;
        int yearTemp = Integer.parseInt(year);
        try {
            psnStartDay = abs.getPsnMonthStart(principal.getName());
            if (psnStartDay >= 16 && psnStartDay <= 31) {
                abDTOs = abs.getAccountBooksByYear(principal.getName(), (yearTemp - 1) + "", year, "12", "12",
                        psnStartDay);
            } else if (psnStartDay >= 1 && psnStartDay <= 15) {
                abDTOs = abs.getAccountBooksByYear(principal.getName(), year, (yearTemp + 1) + "", "01", "01",
                        psnStartDay);
            }
            rEntity = new ResponseEntity<>(abDTOs, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            rEntity = new ResponseEntity<>(HttpStatus.NOT_FOUND);
            return rEntity;
        }
        return rEntity;
    }

    @GetMapping(value = "/ggv/year", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
    public @ResponseBody ResponseEntity<List<String>> getYears(Principal principal) {
        log.info("years get....");
        List<String> years = null;
        ResponseEntity<List<String>> rEntity = null;
        try {
            years = abs.getYearMonth(principal.getName());
            rEntity = new ResponseEntity<>(years, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            rEntity = new ResponseEntity<>(HttpStatus.NOT_FOUND);
            return rEntity;
        }
        return rEntity;
    }

    @GetMapping(value = "/ggv/{articleId}", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
    public @ResponseBody ResponseEntity<AccountBookDTO> getAccountBook(@PathVariable("articleId") int articleId,
            Principal principal) {
        log.info("getAccountBook request....");
        AccountBookDTO abDTO = null;
        ResponseEntity<AccountBookDTO> rEntity = null;
        try {
            abDTO = abs.getAccountBookByArticleId(principal.getName(), articleId);
            rEntity = new ResponseEntity<>(abDTO, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            rEntity = new ResponseEntity<>(HttpStatus.NOT_FOUND);
            return rEntity;
        }
        return rEntity;
    }

    @GetMapping(value = "/psns", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
    public @ResponseBody ResponseEntity<PsnsDTO> getPsns(Principal principal) {
        log.info("getPsns request....");
        PsnsDTO psnsDTO = null;
        ResponseEntity<PsnsDTO> rEntity = null;
        try {
            psnsDTO = abs.getPsns(principal.getName());
            rEntity = new ResponseEntity<>(psnsDTO, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            rEntity = new ResponseEntity<>(HttpStatus.NOT_FOUND);
            return rEntity;
        }
        return rEntity;
    }

    @PostMapping(value = "/psns")
    public String editPsns(PsnsDTO psnsDTO, Principal principal, RedirectAttributes rttr) {
        log.info("psns edit request...." + psnsDTO);
        try {
            rttr.addFlashAttribute("result", abs.editPsns(psnsDTO, principal.getName()));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/accountbook/calendar";
    }

    @GetMapping(value = "/share")
    public @ResponseBody ResponseEntity<String> shareArticle(@RequestParam("articleId") String articleId,
            Principal principal) {
        log.info("shareArticle request...." + articleId);
        ResponseEntity<String> rEntity = null;
        try {
            if (abs.shareArticle(articleId, principal.getName())) {
                rEntity = new ResponseEntity<>("success", HttpStatus.OK);
            } else {
                rEntity = new ResponseEntity<>(HttpStatus.NOT_FOUND);
            }
        } catch (Exception e) {
            e.printStackTrace();
            rEntity = new ResponseEntity<>(HttpStatus.NOT_FOUND);
            return rEntity;
        }
        return rEntity;
    }

    @GetMapping(value = "/sharecancel")
    public @ResponseBody ResponseEntity<String> shareCancelArticle(@RequestParam("articleId") String articleId,
            Principal principal) {
        log.info("shareCancelArticle request...." + articleId);
        ResponseEntity<String> rEntity = null;
        try {
            if (abs.shareCancelArticle(articleId, principal.getName())) {
                rEntity = new ResponseEntity<>("success", HttpStatus.OK);
            } else {
                rEntity = new ResponseEntity<>(HttpStatus.NOT_FOUND);
            }
        } catch (Exception e) {
            e.printStackTrace();
            rEntity = new ResponseEntity<>(HttpStatus.NOT_FOUND);
            return rEntity;
        }
        return rEntity;
    }
}
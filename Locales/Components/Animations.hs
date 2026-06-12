module Locales.Components.Animations where

import Lurk.Prelude (Html)
import Locales.Prelude

webIntelligenceLocale :: Language -> Text
webIntelligenceLocale EN = "Identity Resolved"
webIntelligenceLocale ES = "Identidad Resuelta"
webIntelligenceLocale KO = "신원 확인"

data KanbanLocale = KanbanLocale
    { colQualified :: Text
    , colProposal :: Text
    , colClosing :: Text
    , agentWorking :: Text
    , toastTitle :: Text
    , toastText :: Html
    }

kanbanLocale :: Language -> KanbanLocale
kanbanLocale EN = KanbanLocale
    { colQualified = "Qualified"
    , colProposal = "Proposal"
    , colClosing = "Closing"
    , agentWorking = "Agent working..."
    , toastTitle = "Ruzaani SDR"
    , toastText = "Deal <b>Meta</b> moved to Proposal. Sending summary..."
    }
kanbanLocale ES = KanbanLocale
    { colQualified = "Calificado"
    , colProposal = "Propuesta"
    , colClosing = "Cierre"
    , agentWorking = "Trabajando..."
    , toastTitle = "Ruzaani SDR"
    , toastText = "Trato <b>Meta</b> movido a Propuesta. Enviando resumen..."
    }
kanbanLocale KO = KanbanLocale
    { colQualified = "적격"
    , colProposal = "제안"
    , colClosing = "종결"
    , agentWorking = "작업 중..."
    , toastTitle = "Ruzaani SDR"
    , toastText = "<b>Meta</b> 거래 제안으로 이동. 요약 전송..."
    }

data SalesPipelineLocale = SalesPipelineLocale
    { stageLead :: Text
    , stageQualified :: Text
    , stageCustomer :: Text
    , score :: Text
    , touchPoints :: Text
    , platforms :: Text
    , logNewLead :: Text
    , logSdrAnalyzing :: Text
    , logSdrQual :: Text
    , logSysQual :: Text
    , logAnalystScore :: Text
    , logAnalystRes :: Text
    , logCloserDraft :: Text
    , logCloserSend :: Text
    , logSysCust :: Text
    , logSysRestart :: Text
    }

salesPipelineLocale :: Language -> SalesPipelineLocale
salesPipelineLocale EN = SalesPipelineLocale
    { touchPoints = "Touch Points"
    , platforms = "Platforms"
    , score = "Score"
    , stageLead = "Lead"
    , stageQualified = "Qualified"
    , stageCustomer = "Customer"
    , logNewLead = "[SYSTEM] New lead: Jane Doe (CEO)"
    , logSdrAnalyzing = "[SDR] Analyzing intent signals..."
    , logSdrQual = "[SDR] Qualification: HIGH"
    , logAnalystScore = "[ANALYST] Scoring technical fit..."
    , logSysQual = "[SYSTEM] Stage moved: QUALIFIED"
    , logAnalystRes = "[ANALYST] Result: 98/100 Intent"
    , logCloserDraft = "[CLOSER] Drafting proposal..."
    , logCloserSend = "[CLOSER] Sending for approval..."
    , logSysCust = "[SYSTEM] Stage moved: CUSTOMER"
    , logSysRestart = "[SYSTEM] Loop restart..."
    }
salesPipelineLocale ES = SalesPipelineLocale
    { touchPoints = "Puntos de contacto"
    , platforms = "Plataformas"
    , score = "Puntaje"
    , stageLead = "Prospecto"
    , stageQualified = "Calificado"
    , stageCustomer = "Cliente"
    , logNewLead = "[SISTEMA] Nuevo prospecto: Jane Doe (CEO)"
    , logSdrAnalyzing = "[SDR] Analizando señales de intención..."
    , logSdrQual = "[SDR] Calificación: ALTA"
    , logAnalystScore = "[ANALYST] Scoring technical fit..."
    , logSysQual = "[SISTEMA] Etapa movida: CALIFICADO"
    , logAnalystRes = "[ANALISTA] Resultado: 98/100 Intención"
    , logCloserDraft = "[CLOSER] Redactando propuesta..."
    , logCloserSend = "[CLOSER] Enviando para aprobación..."
    , logSysCust = "[SISTEMA] Etapa movida: CLIENTE"
    , logSysRestart = "[SISTEMA] Reinicio de ciclo..."
    }
salesPipelineLocale KO = SalesPipelineLocale
    { touchPoints = "연락 지점"
    , platforms = "플랫폼"
    , score = "점수"
    , stageLead = "리드"
    , stageQualified = "자격"
    , stageCustomer = "고객"
    , logNewLead = "[시스템] 새로운 리드: 제인 도우 (CEO)"
    , logSdrAnalyzing = "[SDR] 의도 신호 분석 중..."
    , logSdrQual = "[SDR] 자격: 높음"
    , logAnalystScore = "[ANALYST] 기술 적합성 점수 매기기..."
    , logSysQual = "[SYSTEM] 단계 이동: 자격"
    , logAnalystRes = "[ANALYST] 결과: 98/100 의도"
    , logCloserDraft = "[CLOSER] 제안 초안 작성..."
    , logCloserSend = "[CLOSER] 승인을 위해 보내기..."
    , logSysCust = "[SYSTEM] 단계 이동: 고객"
    , logSysRestart = "[SYSTEM] 루프 재시작..."
    }

data EnterpriseIntelLocale = EnterpriseIntelLocale
    { enterpriseIntel :: Text
    , leadScoring :: Text
    , contextualMemory :: Text
    , revOps :: Text
    , revenue :: Text
    }

enterpriseIntelLocale :: Language -> EnterpriseIntelLocale
enterpriseIntelLocale EN = EnterpriseIntelLocale
    { enterpriseIntel = "INTEL"
    , leadScoring = "SCORING"
    , contextualMemory = "MEMORY"
    , revOps = "REVOPS"
    , revenue = "REVENUE"
    }
enterpriseIntelLocale ES = EnterpriseIntelLocale
    { enterpriseIntel = "INTEL"
    , leadScoring = "PUNTAJE"
    , contextualMemory = "MEMORIA"
    , revOps = "REVOPS"
    , revenue = "GANANCIAS"
    }
enterpriseIntelLocale KO = EnterpriseIntelLocale
    { enterpriseIntel = "인텔"
    , leadScoring = "스코어링"
    , contextualMemory = "메모리"
    , revOps = "레브옵스"
    , revenue = "매출"
    }

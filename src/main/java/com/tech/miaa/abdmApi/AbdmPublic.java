package com.tech.miaa.abdmApi;

import java.util.List;

public class AbdmPublic {
    private HeaderResult headerResult;
    private List<AbdmPublicItem> items;
    public AbdmPublic() {

    }
    public AbdmPublic(HeaderResult headerResult, List<AbdmPublicItem> items) {
        this.headerResult = headerResult;
        this.items = items;
    }

    public HeaderResult getHeaderResult() {
        return headerResult;
    }

    public void setHeaderResult(HeaderResult headerResult) {
        this.headerResult = headerResult;
    }

    public List<AbdmPublicItem> getItems() {
        return items;
    }

    public void setItems(List<AbdmPublicItem> items) {
        this.items = items;
    }
}

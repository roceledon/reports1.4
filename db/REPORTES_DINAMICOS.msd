<?xml version="1.0"?>
<VDBDModel ActivePage="0" Version="1"><ModelPage GUID="{6747AED2-3BAB-4EA9-8E2F-E9B57C9F3F69}" Name="New page"><Options Notation="1" ShowEntIcons="true" ShowAttrIcons="true" BringFocusedToFront="true" DrawPKFirst="true" ShowOnlyNames="false" DrawFKNames="false"><Style Object="Page"><Colors Color="16777215" TextColor="0"/><Font Name="Verdana" Size="8"/></Style><Style Object="Entity"><Colors Color="16777215" TextColor="0"/><Font Name="Verdana" Size="8"/></Style><Style Object="EntitySelected"><Colors Color="12648447" TextColor="0"/><Font Name="Verdana" Size="8"/></Style><Style Object="Attr"><Colors Color="536870911" TextColor="0"/><Font Name="Verdana" Size="8"/></Style><Style Object="AttrSelected"><Colors Color="12648447" TextColor="0"/><Font Name="Verdana" Size="8"/></Style><Grid DrawGrid="true" SnapToGrid="true" GridXSize="10" GridYSize="10"/><Area MinX="0" MinY="0" MaxX="10000" MaxY="10000"/></Options><ViewPorts><ViewPort Zoom="20" XOrg="0" YOrg="0" Name="Navigator"/><ViewPort Zoom="100" XOrg="0" YOrg="0" Name="Main"/></ViewPorts><PageMetadata><Table Name="TIPO_PARAMETRO_REPORTE" GUID="{1FA3FB76-B5A1-4E3A-AAFF-50B637340FC9}" PointLX="40" PointLY="460" WidthL="247" HeightL="71" HideSubItems="false" FontColor="-16777208" FontSize="8" FontStyle="   " FontName="Verdana" PenColor="0" BrushColor="16777215"><Attribute FontColor="0" FontSize="8" FontStyle="*  " FontName="Verdana" PenColor="0" BrushColor="12648447"/><Attribute FontColor="0" FontSize="8" FontStyle="   " FontName="Verdana" PenColor="0" BrushColor="16777215"/><Attribute GUID="{D3EA811D-3FFD-42AA-91A5-B8ADD3BC6552}" Name="TPPR_SEQ_CDG" DataType="numeric(16, 0)" NotNull="true" PrimaryKey="true" Unique="true" FontColor="0" FontSize="8" FontStyle="* *" FontName="Verdana" PenColor="0" BrushColor="536870911"/><Attribute GUID="{AACF6DFC-D0D0-473D-95A6-7F0F5CD9E518}" Name="TPPR_NOMBRE" DataType="varchar(50)" NotNull="true" PrimaryKey="false" Unique="true" FontColor="0" FontSize="8" FontStyle="*  " FontName="Verdana" PenColor="0" BrushColor="536870911"/></Table><Table Name="PARAMETROS_REPORTE" GUID="{1E17D0D6-E934-4146-8399-80E9A41EC9BE}" PointLX="440" PointLY="440" WidthL="243" HeightL="112" HideSubItems="false" FontColor="-16777208" FontSize="8" FontStyle="   " FontName="Verdana" PenColor="0" BrushColor="16777215"><Attribute FontColor="0" FontSize="8" FontStyle="*  " FontName="Verdana" PenColor="0" BrushColor="16777215"/><Attribute FontColor="0" FontSize="8" FontStyle="   " FontName="Verdana" PenColor="0" BrushColor="16777215"/><Attribute GUID="{54121080-6C83-4A9C-8DCE-A68D6F585B73}" Name="PARE_SEQ_CDG" DataType="numeric(16, 0)" NotNull="true" PrimaryKey="true" Unique="true" FontColor="0" FontSize="8" FontStyle="* *" FontName="Verdana" PenColor="0" BrushColor="536870911"/><Attribute GUID="{CBC39BFF-DBBA-41B0-906F-CF7D16EDACFB}" Name="TPPR_SEQ_CDG" DataType="numeric(16, 0)" NotNull="true" PrimaryKey="false" Unique="false" FontColor="0" FontSize="8" FontStyle="*  " FontName="Verdana" PenColor="0" BrushColor="536870911"/><Attribute GUID="{A04979B6-5D66-4999-8056-8E6AE1982433}" Name="RPTE_SEQ_CDG" DataType="numeric(16, 0)" NotNull="true" PrimaryKey="false" Unique="false" FontColor="0" FontSize="8" FontStyle="*  " FontName="Verdana" PenColor="0" BrushColor="536870911"/><Attribute GUID="{5E7D0406-FE57-4B61-9574-71596E32388A}" Name="PARE_NOMBRE" DataType="varchar(50)" NotNull="true" PrimaryKey="false" Unique="false" FontColor="0" FontSize="8" FontStyle="*  " FontName="Verdana" PenColor="0" BrushColor="536870911"/><Attribute GUID="{B38128DF-2FF0-4317-B508-56CE7EA2E6D2}" Name="PARE_REQUERIDO" DataType="bit" NotNull="false" PrimaryKey="false" Unique="false" FontColor="0" FontSize="8" FontStyle="   " FontName="Verdana" PenColor="0" BrushColor="536870911"/></Table><Table Name="CONTROLADOR" GUID="{AF99BA0C-C45D-42D2-91FA-634DE7CBA8D0}" PointLX="900" PointLY="420" WidthL="242" HeightL="67" HideSubItems="false" FontColor="-16777208" FontSize="8" FontStyle="   " FontName="Verdana" PenColor="0" BrushColor="16777215"><Attribute FontColor="0" FontSize="8" FontStyle="*  " FontName="Verdana" PenColor="0" BrushColor="16777215"/><Attribute FontColor="0" FontSize="8" FontStyle="   " FontName="Verdana" PenColor="0" BrushColor="16777215"/><Attribute GUID="{D3D6F6A1-3DAE-4312-BF5C-AF470FA337A2}" Name="CTRL_SEQ_CDG" DataType="numeric(16, 0)" NotNull="true" PrimaryKey="true" Unique="true" FontColor="0" FontSize="8" FontStyle="* *" FontName="Verdana" PenColor="0" BrushColor="536870911"/><Attribute GUID="{8A1D0A97-1D9D-4B55-9472-3A256FE7A0C7}" Name="CTRL_NOMBRE" DataType="varchar(60)" NotNull="true" PrimaryKey="false" Unique="true" FontColor="0" FontSize="8" FontStyle="*  " FontName="Verdana" PenColor="0" BrushColor="536870911"/></Table><Relation GUID="{7145396B-80C4-49C2-A172-58EF647A7E90}" Name="CONEXIONES_fk" DisplayName="CONEXIONES_fk" PointLX="0" PointLY="0" PKTable="CONEXIONES" FKTable="CONTROLADOR" BeginSide="3" BeginRatio="0,5" EndSide="1" EndRatio="0,5" RelationType="1" PartParent="0" PartChild="0" ChildCardinality="-1" PointsCount="2"><RelationLink ParentAttribute="CTRL_SEQ_CDG" ChildAttribute="CTRL_SEQ_CDG"/><Point PointLX="1020" PointLY="314"/><Point PointLX="1020" PointLY="424"/></Relation><Relation GUID="{C2904E77-1EE5-4441-8C7F-1F83E621285B}" Name="REPORTE_fk" DisplayName="REPORTE_fk" PointLX="0" PointLY="0" PKTable="REPORTE" FKTable="AREA" BeginSide="0" BeginRatio="0,605769230769231" EndSide="2" EndRatio="0,704225352112676" RelationType="1" PartParent="0" PartChild="0" ChildCardinality="-1" PointsCount="2"><RelationLink ParentAttribute="AREA_SEQ_CDG" ChildAttribute="AREA_SEQ_CDG"/><Point PointLX="404" PointLY="250"/><Point PointLX="287" PointLY="250"/></Relation><Table Name="AREA" GUID="{B77EBDC6-FD89-4225-AE76-CD2DA3EED3C7}" PointLX="40" PointLY="200" WidthL="243" HeightL="67" HideSubItems="false" FontColor="-16777208" FontSize="8" FontStyle="   " FontName="Verdana" PenColor="0" BrushColor="16777215"><Attribute FontColor="0" FontSize="8" FontStyle="*  " FontName="Verdana" PenColor="0" BrushColor="16777215"/><Attribute FontColor="0" FontSize="8" FontStyle="   " FontName="Verdana" PenColor="0" BrushColor="16777215"/><Attribute GUID="{F7286566-4A54-4969-95D2-2DB000DE0A3D}" Name="AREA_SEQ_CDG" DataType="numeric(16, 0)" NotNull="true" PrimaryKey="true" Unique="true" FontColor="0" FontSize="8" FontStyle="* *" FontName="Verdana" PenColor="0" BrushColor="536870911"/><Attribute GUID="{9D24B858-DD3F-4CD7-90D2-DE0456DCBF89}" Name="AREA_NOMBRE" DataType="varchar(80)" NotNull="true" PrimaryKey="false" Unique="true" FontColor="0" FontSize="8" FontStyle="*  " FontName="Verdana" PenColor="0" BrushColor="536870911"/></Table><Table Name="CONEXIONES" GUID="{7C79BB25-56AF-4171-B705-DA5E811334CB}" PointLX="850" PointLY="150" WidthL="326" HeightL="160" HideSubItems="false" FontColor="-16777208" FontSize="8" FontStyle="   " FontName="Verdana" PenColor="0" BrushColor="16777215"><Attribute FontColor="0" FontSize="8" FontStyle="*  " FontName="Verdana" PenColor="0" BrushColor="16777215"/><Attribute FontColor="0" FontSize="8" FontStyle="   " FontName="Verdana" PenColor="0" BrushColor="16777215"/><Attribute GUID="{A7141B77-1CC2-4732-8EF7-74095B9F4EAB}" Name="CONX_SEQ_CDG" DataType="numeric(16, 0)" NotNull="true" PrimaryKey="true" Unique="true" FontColor="0" FontSize="8" FontStyle="* *" FontName="Verdana" PenColor="0" BrushColor="536870911"/><Attribute GUID="{B87390AB-2D3E-44F6-A21E-1BFA21DDCD45}" Name="CTRL_SEQ_CDG" DataType="numeric(16, 0)" NotNull="true" PrimaryKey="false" Unique="false" FontColor="0" FontSize="8" FontStyle="*  " FontName="Verdana" PenColor="0" BrushColor="536870911"/><Attribute GUID="{64425789-D489-4990-BAB0-7C2A0AF32ED3}" Name="CONX_NOMBRE" DataType="varchar(50)" NotNull="true" PrimaryKey="false" Unique="true" FontColor="0" FontSize="8" FontStyle="*  " FontName="Verdana" PenColor="0" BrushColor="536870911"/><Attribute GUID="{C7990622-1E99-43D0-9FF4-6A218CBDB699}" Name="CONX_URL" DataType="varchar(500)" NotNull="true" PrimaryKey="false" Unique="false" FontColor="0" FontSize="8" FontStyle="*  " FontName="Verdana" PenColor="0" BrushColor="536870911"/><Attribute GUID="{6848645E-DBCD-4D5B-B088-50706D1A8C4F}" Name="CONX_USUARIO_CREADOR" DataType="varchar(1)" NotNull="true" PrimaryKey="false" Unique="false" FontColor="0" FontSize="8" FontStyle="*  " FontName="Verdana" PenColor="0" BrushColor="536870911"/><Attribute GUID="{5968E599-1F69-43CF-AC30-CF4C9943231F}" Name="CONX_FECHA_CREACION" DataType="datetime" NotNull="false" PrimaryKey="false" Unique="false" FontColor="0" FontSize="8" FontStyle="   " FontName="Verdana" PenColor="0" BrushColor="536870911"/><Attribute GUID="{5E9040BA-9FF3-47E2-92AD-2F6029C262A2}" Name="CONX_USUARIO_MODIFICADOR" DataType="varchar(1)" NotNull="true" PrimaryKey="false" Unique="false" FontColor="0" FontSize="8" FontStyle="*  " FontName="Verdana" PenColor="0" BrushColor="536870911"/><Attribute GUID="{2B28DE67-9E51-497E-8411-78F3C5C7D67C}" Name="CONX_FECHA_MODIFICACION" DataType="datetime" NotNull="false" PrimaryKey="false" Unique="false" FontColor="0" FontSize="8" FontStyle="   " FontName="Verdana" PenColor="0" BrushColor="536870911"/></Table><Relation GUID="{A3EE8028-2B6F-400B-BF3E-737403E3B12A}" Name="REPORTE_fk2" DisplayName="REPORTE_fk2" PointLX="0" PointLY="0" PKTable="REPORTE" FKTable="CONEXIONES" BeginSide="2" BeginRatio="0,5" EndSide="0" EndRatio="0,5" RelationType="1" PartParent="0" PartChild="0" ChildCardinality="-1" PointsCount="2"><RelationLink ParentAttribute="CONX_SEQ_CDG" ChildAttribute="CONX_SEQ_CDG"/><Point PointLX="725" PointLY="230"/><Point PointLX="854" PointLY="230"/></Relation><Relation GUID="{9D0915DD-A71F-4ED6-964A-4F69F70AFECE}" Name="PARAMETROS_REPORTE_fk" DisplayName="PARAMETROS_REPORTE_fk" PointLX="0" PointLY="0" PKTable="PARAMETROS_REPORTE" FKTable="TIPO_PARAMETRO_REPORTE" BeginSide="0" BeginRatio="0,5" EndSide="2" EndRatio="0,5" RelationType="1" PartParent="0" PartChild="0" ChildCardinality="-1" PointsCount="2"><RelationLink ParentAttribute="TPPR_SEQ_CDG" ChildAttribute="TPPR_SEQ_CDG"/><Point PointLX="444" PointLY="500"/><Point PointLX="287" PointLY="500"/></Relation><Relation GUID="{241A9C04-EB2F-4D97-B1C4-617E1952B235}" Name="PARAMETROS_REPORTE_fk2" DisplayName="PARAMETROS_REPORTE_fk2" PointLX="0" PointLY="0" PKTable="PARAMETROS_REPORTE" FKTable="REPORTE" BeginSide="1" BeginRatio="0,5" EndSide="3" EndRatio="0,5" RelationType="1" PartParent="0" PartChild="0" ChildCardinality="-1" PointsCount="4"><RelationLink ParentAttribute="RPTE_SEQ_CDG" ChildAttribute="RPTE_SEQ_CDG"/><Point PointLX="570" PointLY="444"/><Point PointLX="570" PointLY="388"/><Point PointLX="560" PointLY="388"/><Point PointLX="560" PointLY="332"/></Relation><Table Name="REPORTE" GUID="{065E0F06-5704-4A5E-8AE9-0A42CD1EFD01}" PointLX="400" PointLY="120" WidthL="321" HeightL="208" HideSubItems="false" FontColor="-16777208" FontSize="8" FontStyle="   " FontName="Verdana" PenColor="0" BrushColor="16777215"><Attribute FontColor="0" FontSize="8" FontStyle="*  " FontName="Verdana" PenColor="0" BrushColor="16777215"/><Attribute FontColor="0" FontSize="8" FontStyle="   " FontName="Verdana" PenColor="0" BrushColor="16777215"/><Attribute GUID="{B3B77905-43AC-48C4-82AC-251E0FDA1216}" Name="RPTE_SEQ_CDG" DataType="numeric(16, 0)" NotNull="true" PrimaryKey="true" Unique="true" FontColor="0" FontSize="8" FontStyle="* *" FontName="Verdana" PenColor="0" BrushColor="536870911"/><Attribute GUID="{FCE945CA-59DA-409C-A4BE-B1DA6A1AE0F8}" Name="AREA_SEQ_CDG" DataType="numeric(16, 0)" NotNull="true" PrimaryKey="false" Unique="false" FontColor="0" FontSize="8" FontStyle="*  " FontName="Verdana" PenColor="0" BrushColor="536870911"/><Attribute GUID="{BF027EE6-F8E5-4BA9-BD31-954722292CEE}" Name="CONX_SEQ_CDG" DataType="numeric(16, 0)" NotNull="true" PrimaryKey="false" Unique="false" FontColor="0" FontSize="8" FontStyle="*  " FontName="Verdana" PenColor="0" BrushColor="536870911"/><Attribute GUID="{9AB138F8-DD0E-4F84-8696-2E4469C076A9}" Name="RPTE_NOMBRE" DataType="varchar(50)" NotNull="true" PrimaryKey="false" Unique="true" FontColor="0" FontSize="8" FontStyle="*  " FontName="Verdana" PenColor="0" BrushColor="536870911"/><Attribute GUID="{F9D6E4FB-7FE4-45BC-8A1B-98184F1C2986}" Name="RPTE_DESCRIPCION" DataType="varchar(500)" NotNull="false" PrimaryKey="false" Unique="false" FontColor="0" FontSize="8" FontStyle="   " FontName="Verdana" PenColor="0" BrushColor="536870911"/><Attribute GUID="{67CFABE2-CCF0-4101-8B39-4057D461220E}" Name="RPTE_SQL" DataType="varchar(max)" NotNull="true" PrimaryKey="false" Unique="false" FontColor="0" FontSize="8" FontStyle="*  " FontName="Verdana" PenColor="0" BrushColor="536870911"/><Attribute GUID="{BF3B2E2A-2B7F-49A2-9A73-CBEA1C6AAD21}" Name="RPTE_ACTIVO" DataType="bit" NotNull="true" PrimaryKey="false" Unique="false" FontColor="0" FontSize="8" FontStyle="*  " FontName="Verdana" PenColor="0" BrushColor="536870911"/><Attribute GUID="{C04DEC6F-088C-49D1-B258-D409016DF20C}" Name="RPTE_USUARIO_CREADOR" DataType="varchar(1)" NotNull="true" PrimaryKey="false" Unique="false" FontColor="0" FontSize="8" FontStyle="*  " FontName="Verdana" PenColor="0" BrushColor="536870911"/><Attribute GUID="{73333F8F-08CD-4CA2-B67D-2A1A70C82952}" Name="RPTE_FECHA_CREACION" DataType="datetime" NotNull="false" PrimaryKey="false" Unique="false" FontColor="0" FontSize="8" FontStyle="   " FontName="Verdana" PenColor="0" BrushColor="536870911"/><Attribute GUID="{EA9010CA-8C46-4836-A7CD-D3020AF05715}" Name="RPTE_USUARIO_MODIFICADOR" DataType="varchar(1)" NotNull="true" PrimaryKey="false" Unique="false" FontColor="0" FontSize="8" FontStyle="*  " FontName="Verdana" PenColor="0" BrushColor="536870911"/><Attribute GUID="{B53FBACA-D692-4AC1-983D-8D79449AE0E2}" Name="RPTE_FECHA_MODIFICACION" DataType="datetime" NotNull="false" PrimaryKey="false" Unique="false" FontColor="0" FontSize="8" FontStyle="   " FontName="Verdana" PenColor="0" BrushColor="536870911"/></Table></PageMetadata></ModelPage></VDBDModel>

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DCMS_V7.App_Code
{
    public class C_Lab
    {
        public static List<RequestedItem> GetListofAllRequestedPieces(int labID)
        {
            DCMS_DBDataContext DB = new DCMS_DBDataContext();
            var requestedPiecesID = from RPID in DB.Pieces
                                    select RPID.ID;
            var requestedPiece = from RP in DB.RequestedItems
                                 where RP.LabID == labID && requestedPiecesID.Contains(RP.ID)
                                 select RP;
            return requestedPiece.ToList();
        }
        public static List<RequestedItem> GetListofPatientRequestedImages(int labID, int PatientID)
        {
            DCMS_DBDataContext DB = new DCMS_DBDataContext();
            var requestedImageID = from RIID in DB.Images
                                   select RIID.ID;
            var requestedImage = from RI in DB.RequestedItems
                                 where RI.LabID == labID && requestedImageID.Contains(RI.ID) && RI.PatientID == PatientID
                                 select RI;
            return requestedImage.ToList();
        }
        public static string GetPieceStatus(int PieceID)
        {
            DCMS_DBDataContext DB = new DCMS_DBDataContext();
            var piecestatus = (from PS in DB.Pieces
                               where PS.ID == PieceID
                               select PS.Status).Single();
            return piecestatus;
        }
        public static void SetPieceStatus(int PieceID, string Status)
        {
            DCMS_DBDataContext DB = new DCMS_DBDataContext();
            var piece = (from PS in DB.Pieces
                         where PS.ID == PieceID
                         select PS).Single();
            piece.Status = Status;
            try
            {
                DB.SubmitChanges();
            }
            catch
            {
                DB.SubmitChanges();
            }
        }
        public static string GetPieceType(int PieceID)
        {
            DCMS_DBDataContext DB = new DCMS_DBDataContext();
            var piecetypeID = (from P in DB.Pieces
                               where P.ID == PieceID
                               select P.TypeID).Single();
            var piecetype = (from PT in DB.PieceTypes
                             where PT.ID == piecetypeID
                             select PT.TypeString).Single();
            return piecetype;
        }
        public static string GetImageType(int ImageID)
        {
            DCMS_DBDataContext DB = new DCMS_DBDataContext();
            var imagetypeID = (from I in DB.Images
                               where I.ID == ImageID
                               select I.TypeID).Single();
            var Imagetype = (from IT in DB.ImageTypes
                             where IT.ID == imagetypeID
                             select IT.TypeString).Single();
            return Imagetype;
        }
        public static void SetImageURL(int imageID, string URL)
        {
            DCMS_DBDataContext DB = new DCMS_DBDataContext();
            var img = (from I in DB.Images
                       where I.ID == imageID
                       select I).Single();
            img.ImageURL = URL;
            try
            {
                DB.SubmitChanges();
            }
            catch
            {
                DB.SubmitChanges();
            }
        }
    }
}